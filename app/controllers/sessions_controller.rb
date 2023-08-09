# # app/controllers/sessions_controller.rb
# class SessionsController < ApplicationController
#     def new
#       # Render the login form
#     end
  
#     def create
#       customer = Customer.find_by(email: params[:session][:email])
#       driver = Driver.find_by(email: params[:session][:email])
#       admin = Admin.find_by(email: params[:session][:email])
  
#       if customer&.authenticate(params[:session][:password_digest])
#         session[:user_id] = customer.id
#         render json: customer
      
#       elsif driver&.authenticate(params[:session][:password_digest])
#         session[:user_id] = driver.id
#         render json: driver
#       elsif admin&.authenticate(params[:session][:password_digest])
#         session[:user_id] = admin.id
#         render json: admin
      
#       else
#         flash.now[:alert] = 'Invalid email or password.'
#         render :new
#       end
#     end
  
#     def destroy
#       session.delete(:user_id)
#       head :no_content
#     end
#   end
  
  