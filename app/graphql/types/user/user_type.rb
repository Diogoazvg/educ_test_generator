# frozen_string_literal: true

module Types
  module User
    class UserType < GraphQL::Schema::Object
      field :id, Int, null: false
      field :authentication_token, String, null: false
      field :email, String, null: true
      field :first_name, String, null: false
      field :last_name, String, null: false
    end
  end
end
