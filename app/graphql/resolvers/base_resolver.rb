# frozen_string_literal: true

module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    argument :authorization_code, String, required: false
  end
end
