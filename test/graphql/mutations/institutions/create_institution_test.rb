require 'test_helper'

class CreateInstitutionTest < ActiveSupport::TestCase
  include GraphqlRequestHelper

  setup do
    available_user = create(:user_with_permission, permission_name: 'create_institution')
    @user = available_user.user
  end

  def context
    { query_name: 'create_institution', current_user: @user }
  end

  def query
    <<~GRAPHQL
      mutation{
        createInstitution(
          input:{
            name: "SomeInstitution27"
          }
        ){
         status
        }
      }
    GRAPHQL
  end

  test 'when try to create a institution but any data is malformed' do
    def query
      <<~GRAPHQL
        mutation{
          createInstitution(
            input:{
              name: "SomeInstitution27"
              imageData: "123456"
            }
          ){
           status
          }
        }
      GRAPHQL
    end

    assert_equal([{ 'code' => 'NOT_CREATED' }], graphql_fail_request.map { |v| v['extensions'] })
  end

  test 'when try to create a institution without necessary permission' do
    @user = create(:user)

    assert_equal(
      [{ 'message' => 'Sem permissão!', 'extensions' => { 'code' => 'NO_PERMISSION_USER' } }], graphql_fail_request
    )
  end
  test 'when try to create a institution with all necessary data' do
    assert_equal({ 'status' => 'success' }, graphql_success_request['createInstitution'])
  end
end
