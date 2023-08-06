# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
    def new
      # Render the login form
    end
  
    def create
      customer = Customer.find_by(email: params[:session][:email])
      driver = Driver.find_by(email: params[:session][:email])
      admin = Admin.find_by(email: params[:session][:email])
  
      if customer&.authenticate(params[:session][:password])
        session[:user_id] = customer.id
        redirect_to customer_path(customer), notice: 'Logged in successfully as a customer.'
      elsif driver&.authenticate(params[:session][:password])
        session[:user_id] = driver.id
        redirect_to driver_path(driver), notice: 'Logged in successfully as a driver.'
      elsif admin&.authenticate(params[:session][:password])
        session[:user_id] = admin.id
        redirect_to admin_path(admin), notice: 'Logged in successfully as an admin.'
      else
        flash.now[:alert] = 'Invalid email or password.'
        render :new
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out successfully.'
    end
  end
  
  