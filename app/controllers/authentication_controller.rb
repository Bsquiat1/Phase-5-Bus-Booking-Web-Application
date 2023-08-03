# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
    def login
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        render json: { token: user.generate_jwt }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  end
  