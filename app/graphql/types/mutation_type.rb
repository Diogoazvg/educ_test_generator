# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :user_signup, mutation: Mutations::User::Signup
    field :user_signin, mutation: Mutations::User::Signin
  end
end
