# frozen_string_literal: true

require 'test_helper'

class FindUserByNameTest < ActiveSupport::TestCase
  include GraphqlRequestHelper
  setup do
    @user = create(:user)
    @nonexistent_name = 'NonexistentName'
    @permited_user = create(:user_with_permission, permission_name: 'user_find_by_name')
  end

  def context
    { query_name: 'user_find_by_name', current_user: @permited_user.user }
  end

  test 'returns the user with the specified name' do
    def query
      <<~GQL
        query {
          userFindByName(name: "#{@user.first_name}") {
            id
            firstName
          }
        }
      GQL
    end
    result = graphql_success_request

    assert_equal({ 'id' => @user.id, 'firstName' => @user.first_name }, result['userFindByName'])
  end

  test 'returns nil when user with the specified name is not found' do
    def query
      <<~GQL
        query {
          userFindByName(name: "#{@nonexistent_name}") {
            id
          }
        }
      GQL
    end

    assert_nil graphql_success_request['userFindByName']
  end
end
