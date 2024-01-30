# frozen_string_literal: true

require 'test_helper'

class SigninTest < ActiveSupport::TestCase
  include GraphqlRequestHelper

  test 'when user do not exists' do
    result = graphql_fail_request_var(query_string(variables(email: 'user@test.com')))

    assert_equal(['User not registered on this application'], result.map { |m| m['message'] })
  end

  test 'when user exists, but password is wrong' do
    user
    result = graphql_fail_request_var(query_string(variables(password: '12345679')))
    assert_equal(['Incorrect Email/Password'], result.map { |m| m['message'] })
  end

  test 'when success Login' do
    user
    result = graphql_success_request_var(query_string(variables))
    assert_equal(variables[:email], result['userSignin']['email'])
  end

  def user
    @user ||= create(:user)
  end

  def variables(email: user.email, password: '12345678')
    { email:, password: }
  end

  def query_string(variables)
    <<-GRAPHQL
      mutation{
        userSignin(
          input:{
            email: "#{variables[:email]}"
            password: "#{variables[:password]}"
          }
        ){
          email
        }
      }
    GRAPHQL
  end
end
