# frozen_string_literal: true

module Mutations
  module User
    class Signup < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      type Types::User::SignupType

      def resolve(email:, password:)
        { response: 'created' } if ::User.create!(email: email.downcase, password:)
      rescue StandardError
        GraphQL::ExecutionError.new('Creating Error!')
      end
    end
  end
end
