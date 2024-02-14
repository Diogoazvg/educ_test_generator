# frozen_string_literal: true

module Errors
  module GraphqlErrors
    extend ActiveSupport::Concern

    included do
      def self.default_graphql_error(message, code)
        raise GraphQL::ExecutionError.new(I18n.t(message), extensions: { code: })
      end
    end
  end
end
