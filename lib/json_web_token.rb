# frozen_string_literal: true

require 'jwt'

module JsonWebToken
  SECRET = ENV.fetch('SECRET_KEY', '8557574bftdtrsd*bufd%@$$%&KGGIFYFYDYD')

  class << self
    def encode(payload, exp: 60.minutes.to_i)
      selected = selected_colunms(payload)
      selected[:exp] = Time.current.to_i + exp
      JWT.encode(selected, SECRET, 'HS256')
    end

    def decode(token)
      JWT.decode(token, SECRET, true, { algorithm: 'HS256' })
    end

    private

    def selected_colunms(payload)
      payload.slice('id', 'authentication_token', 'name', 'email')
    end
  end
end
