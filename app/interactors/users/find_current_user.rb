# frozen_string_literal: true

require 'json_web_token'

module Users
  class FindCurrentUser
    include Interactor

    delegate :token, to: :context

    def call
      decoded = JsonWebToken.decode(token)
      user(decoded[0]['id'])
    end

    private

    def user(id)
      context.user = User.find(id)
    end
  end
end
