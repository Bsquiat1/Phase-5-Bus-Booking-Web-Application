class ApplicationController < ActionController::API
  include ActionController::Cookies

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded = decode_token(token)
      @current_user = User.find(decoded[:user_id]) if decoded
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end

  def current_user
    return nil unless cookies.signed[:jwt_token]
    @current_user ||= User.find_by(id: decode_token(cookies.signed[:jwt_token])['user_id'])
  end

  private

  def decode_token(token)
    JWT.decode(token, JWT_SECRET_KEY, true, algorithm: JWT_ALGORITHM).first
  end
end
