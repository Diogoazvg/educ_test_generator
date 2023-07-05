# frozen_string_literal: true

module Types
  module User
    class UserAuthType < GraphQL::Schema::Object
      field :authentication_token, String, null: false
      field :user, UserType, null: true

      def user
        object
      end
    end
  end
end
