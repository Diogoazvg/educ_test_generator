# frozen_string_literal: true

module Resolvers
  module User
    class FindUserByName < BaseResolver
      description 'Find user by name'
      type Types::User::UserType, null: true

      argument :name, String, required: true

      def resolve(name:)
        Users::FindUserByName.call(name:).user
      end
    end
  end
end
