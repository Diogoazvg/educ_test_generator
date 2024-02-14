# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    include Errors::GraphqlErrors
    field :user_find_by_name, resolver: Resolvers::User::FindUserByName

    def self.authorized?(_object, context)
      if context[:current_user] && !context[:current_user]&.permissions
                                                          &.pluck(:permission_name)&.include?(context[:query_name])
        default_graphql_error('permissions.errors.no_permission', 'NO_PERMISSION_USER')
      end

      true
    end
  end
end
