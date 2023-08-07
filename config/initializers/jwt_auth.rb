# config/initializers/jwt_auth.rb

require 'jwt'

JWT_SECRET_KEY = Rails.application.credentials.secret_key_base
JWT_ALGORITHM = 'HS256'
JWT_EXPIRATION_TIME = 10.day.to_i # Set the expiration time for the token (1 day in this example)

def encode_token(payload)
  JWT.encode(payload, JWT_SECRET_KEY, JWT_ALGORITHM)
end

def decode_token(token)
  JWT.decode(token, JWT_SECRET_KEY, true, algorithm: JWT_ALGORITHM).first
end

def current_user
  return nil unless cookies.signed[:jwt_token]

  @current_user ||= User.find_by(id: decode_token(cookies.signed[:jwt_token])['user_id'])
end
