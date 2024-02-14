# frozen_string_literal: true

# test/graphql/types/query_type_test.rb

require 'test_helper'
module Types
  class QueryTypeTest < ActiveSupport::TestCase
    setup do
      @current_user = create(:user)
      @context = { current_user: @current_user, query_name: 'user_find_by_name' }
      @klass = Types::QueryType
    end

    test 'authorized? should return true for a user with the necessary permission' do
      @current_user.permissions.create(permission_name: 'user_find_by_name')

      result = @klass.authorized?(nil, @context)

      assert result, 'authorized? should return true for a user with the necessary permission'
    end

    test 'authorized? should return an error for a user without the necessary permission' do
      setup  { @context = { current_user: @current_user, query_name: 'another_query_name' } }

      assert_raises GraphQL::ExecutionError, 'Sem permissão!' do
        @klass.authorized?(nil, @context)
      end
    end
  end
end
