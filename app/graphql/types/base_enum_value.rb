# frozen_string_literal: true

module Types
  class BaseEnumValue < GraphQL::Schema::EnumValue
    include ApolloFederation::EnumValue
  end
end
