# test/graphql/types/mutation_type_test.rb

require 'test_helper'

module Types
  class MutationTypeTest < ActiveSupport::TestCase
    setup do
      @current_user = create(:user_with_permission, permission_name: 'either_permission')
      @context = { current_user: @current_user.user }
      @klass = Types::MutationType
    end

    test 'authorized? should return true for allowed mutations' do
      allowed_mutations = %w[user_signup user_signin]

      allowed_mutations.each do |mutation_name|
        @context[:query_name] = mutation_name
        result = Types::MutationType.authorized?(nil, @context)
        assert result, "authorized? should return true for #{mutation_name}"
      end
    end

    test 'authorized? should return true for a user with the necessary permission' do
      @context[:query_name] = 'either_permission'
      result = Types::MutationType.authorized?(nil, @context)

      assert result, 'authorized? should return true for a user with the necessary permission'
    end

    test 'authorized? should return an error for a user without the necessary permission' do
      @context[:query_name] = 'user_sig'

      assert_raises GraphQL::ExecutionError, 'Sem permissão!' do
        @klass.authorized?(nil, @context)
      end
    end
  end
end
