# app/controllers/registrations_controller.rb

class RegistrationsController < ApplicationController
  def new
    # Render the signup form
  end

  def create
    profile_type = params[:profile_type]
    case profile_type
    when 'customer'
      create_customer
    when 'driver'
      create_driver
    when 'admin'
      create_admin
    else
      redirect_to signup_path, alert: 'Invalid profile type.'
    end
  end

  private

  def create_customer
    customer = Customer.new(registration_params)
    if customer.save
      session[:user_id] = customer.id
      redirect_to customer_path(customer), notice: 'Customer account created successfully.'
    else
      render :new
    end
  end

  def create_driver
    driver = Driver.new(registration_params)
    if driver.save
      session[:user_id] = driver.id
      redirect_to driver_path(driver), notice: 'Driver account created successfully.'
    else
      render :new
    end
  end

  def create_admin
    admin = Admin.new(registration_params)
    if admin.save
      session[:user_id] = admin.id
      redirect_to admin_path(admin), notice: 'Admin account created successfully.'
    else
      render :new
    end
  end

  def registration_params
    params.require(:registration).permit(:name, :email, :password, :password_confirmation)
  end
end
