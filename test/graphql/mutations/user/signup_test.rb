# frozen_string_literal: true

require 'test_helper'

class SignupTest < ActiveSupport::TestCase
  include GraphqlRequestHelper

  setup { @user = attributes_for(:user) }

  test 'when fail, user not created' do
    result = graphql_fail_request_var(query(variables), { query_name: 'user_signup' })
    assert_equal(['Creating Error!'], result.map { |m| m['message'] })
  end

  test 'when success create user' do
    result = graphql_success_request_var(query(@user), { query_name: 'user_signup' })

    assert_equal({ 'response' => 'created' }, result['userSignup'])
  end

  def variables(email: 'user@test.com', password: '12345', first_name: '', last_name: '')
    { email:, password:, first_name:, last_name: }
  end

  def query(variables)
    <<-GRAPHQL
      mutation{
        userSignup(
          input:{
            email: "#{variables[:email]}"
            password: "#{variables[:password]}"
            firstName: "#{variables[:first_name]}"
            lastName: "#{variables[:last_name]}"
          }
        ){
          response
        }
      }
    GRAPHQL
  end
end
