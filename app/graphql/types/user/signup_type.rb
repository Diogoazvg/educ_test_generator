# frozen_string_literal: true

module Types
  module User
    class SignupType < GraphQL::Schema::Object
      field :response, String, null: false
    end
  end
end
