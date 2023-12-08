# frozen_string_literal: true

require 'test_helper'

class SignupTest < ActiveSupport::TestCase
  include GraphqlRequestHelper

  test 'when fail, user not created' do
    user
    result = graphql_fail_request(query_string(variables))
    assert_equal(['Creating Error!'], result.map { |m| m['message'] })
  end

  test 'when success create user' do
    result = graphql_success_request(query_string(variables))

    assert_equal({ 'response' => 'created' }, result['userSignup'])
  end

  def user
    User.create(variables)
  end

  def variables(email: 'user@test.com', password: '12345678')
    { email:, password: }
  end

  def query_string(variables)
    <<-GRAPHQL
      mutation{
        userSignup(
          input:{
            email: "#{variables[:email]}"
            password: "#{variables[:password]}"
          }
        ){
          response
        }
      }
    GRAPHQL
  end
end
