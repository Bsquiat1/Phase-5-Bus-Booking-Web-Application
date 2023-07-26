# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
  
      if user&.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        cookies.signed[:jwt_token] = { value: token, httponly: true, expires: JWT_EXPIRATION_TIME.from_now }
        render json: { message: 'Login successful', user: user }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    def destroy
      cookies.delete(:jwt_token)
      render json: { message: 'Logout successful' }
    end
  end
  