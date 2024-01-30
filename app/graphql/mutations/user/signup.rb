# frozen_string_literal: true

module Mutations
  module User
    class Signup < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true
      argument :first_name, String, required: true
      argument :last_name, String, required: true

      type Types::User::SignupType

      def resolve(email:, password:, first_name:, last_name:)
        { response: 'created' } if ::User.create!(email: email.downcase, password:, first_name:, last_name:)
      rescue StandardError
        GraphQL::ExecutionError.new('Creating Error!')
      end
    end
  end
end
