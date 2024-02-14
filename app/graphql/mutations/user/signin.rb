# frozen_string_literal: true

require 'json_web_token'

module Mutations
  module User
    class Signin < Mutations::BaseMutation
      graphql_name 'SignIn'

      argument :email, String, required: true
      argument :password, String, required: true

      type Types::User::UserType

      def resolve(**args)
        user ||= ::User.find_for_database_authentication(email: args[:email])

        if user.present?
          if user.valid_password?(args[:password])
            context[:current_user] = user
            user.attributes.merge(token: JsonWebToken.encode(user.attributes))
          else
            GraphQL::ExecutionError.new('Incorrect Email/Password')
          end
        else
          GraphQL::ExecutionError.new('User not registered on this application')
        end
      end
    end
  end
end
