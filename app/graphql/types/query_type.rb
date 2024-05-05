# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    include Errors::GraphqlErrors
    field :user_find_by_name, resolver: Resolvers::User::FindUserByName

    def self.authorized?(_object, context)
      return true if %w[root_query].include?(context[:query_name])
      return permission_error if context[:current_user]&.permissions&.pluck(:permission_name).nil?
      return true if context[:current_user].permissions.pluck(:permission_name).include?(context[:query_name])

      permission_error
    end
  end
end
