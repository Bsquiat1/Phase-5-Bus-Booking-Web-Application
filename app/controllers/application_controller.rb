class ApplicationController < ActionController::API
    
        
      
        protected
      
        def decode_token(token)
          begin
            body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
            HashWithIndifferentAccess.new body
          rescue JWT::DecodeError => e
            # Handle invalid token, e.g. return nil or raise an error
            nil
          end
        end
      
end
