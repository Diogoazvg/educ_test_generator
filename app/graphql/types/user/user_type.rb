# frozen_string_literal: true

module Types
  module User
    class UserType < GraphQL::Schema::Object
      field :email, String, null: false
    end
  end
end
