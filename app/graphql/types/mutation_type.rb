# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    include Errors::GraphqlErrors
    field :user_signup, mutation: Mutations::User::Signup
    field :user_signin, mutation: Mutations::User::Signin

    def self.authorized?(_object, context)
      return true if %w[user_signup user_signin].include?(context[:query_name])
      return permission_error if context[:current_user]&.permissions&.pluck(:permission_name).nil?

      return true if context[:current_user].permissions.pluck(:permission_name).include?(context[:query_name])

      permission_error
    end
  end
end
