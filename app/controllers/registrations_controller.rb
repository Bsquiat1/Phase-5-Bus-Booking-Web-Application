class RegistrationsController < ApplicationController
 def new
 
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
      render json: { error: 'Invalid profile type.' }, status: :unprocessable_entity
    end
  end

  private

  def create_customer
    customer = Customer.create(registration_params)
    if customer.save
      session[:user_id] = customer.id
      render json: { 
        user: customer,
        notice: 'Customer account created successfully.',
        additional_data: 'Additional data for customer' # Add any additional data you want to include
      }, status: :created
    else
      render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create_driver
    driver = Driver.create(registration_params)
    if driver.save
      session[:user_id] = driver.id
      render json: { 
        user: driver,
        notice: 'Driver account created successfully.',
        additional_data: 'Additional data for driver' # Add any additional data you want to include
      }, status: :created
    else
      render json: { errors: driver.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create_admin
    admin = Admin.create(registration_params)
    if admin.save
      session[:user_id] = admin.id
      render json: { 
        user: admin,
        notice: 'Admin account created successfully.',
        additional_data: 'Additional data for admin' # Add any additional data you want to include
      }, status: :created
    else
      render json: { errors: admin.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def registration_params
    params.require(:registration).permit(:name, :email, :password, :admin_id)
  end
end
