# frozen_string_literal: true

module Mutations
  module User
    class Signup < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      type Types::User::UserType

      def resolve(email:, password:)
        if ::User.create!(email: email.downcase, password:)
          GraphQL::ExecutionError.new('Created!')
        else
          GraphQL::ExecutionError.new('Create Error!')
        end
      end
    end
  end
end
