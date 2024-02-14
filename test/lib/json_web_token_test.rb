# frozen_string_literal: true

# test/lib/json_web_token_test.rb

require 'test_helper'
require 'json_web_token'

class JsonWebTokenTest < ActiveSupport::TestCase
  test 'encodes and decodes a payload' do
    payload = { 'id' => 1, 'authentication_token' => 'token123', 'name' => 'John Doe', 'email' => 'john@example.com' }
    token = JsonWebToken.encode(payload)

    assert_not_nil token, 'Token should not be nil'

    decoded_payload = JsonWebToken.decode(token).first

    assert_equal payload['id'], decoded_payload['id'], 'Decoded id should match'
    assert_equal payload['authentication_token'], decoded_payload['authentication_token'],
                 'Decoded authentication_token should match'
    assert_equal payload['name'], decoded_payload['name'], 'Decoded name should match'
    assert_equal payload['email'], decoded_payload['email'], 'Decoded email should match'
  end
end
