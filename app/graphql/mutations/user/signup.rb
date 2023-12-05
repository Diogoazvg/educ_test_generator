# frozen_string_literal: true

module Mutations
  module User
    class Signup < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      type Types::User::SignupType

      def resolve(email:, password:)
        if ::User.create!(email: email.downcase, password:)
          { response: 'created' }
        else
          GraphQL::ExecutionError.new('Create Error!')
        end
      end
    end
  end
end
