# frozen_string_literal: true

module Errors
  module GraphqlErrors
    extend ActiveSupport::Concern

    included do
      def default_graphql_error(message, code)
        raise GraphQL::ExecutionError.new(I18n.t(message), extensions: { code: })
      end

      def self.default_graphql_error(message, code)
        raise GraphQL::ExecutionError.new(I18n.t(message), extensions: { code: })
      end

      def self.permission_error
        default_graphql_error('permissions.errors.no_permission', 'NO_PERMISSION_USER')
      end
    end
  end
end
