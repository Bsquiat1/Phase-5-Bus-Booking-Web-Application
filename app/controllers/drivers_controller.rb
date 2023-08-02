# app/controllers/drivers_controller.rb

class DriversController < ApplicationController
  before_action :authenticate_user
  before_action :set_driver, only: [:show, :update, :destroy]

  # GET /drivers
  def index
    @drivers = Driver.all
    render json: @drivers
  end

  # GET /drivers/:id
  def show
    render json: @driver
  end

  # POST /drivers
  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      render json: @driver, status: :created
    else
      render json: @driver.errors, status: :unprocessable_entity
    end
  end

  # PUT /drivers/:id
  def update
    if @driver.update(driver_params)
      render json: @driver
    else
      render json: @driver.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drivers/:id
  def destroy
    @driver.destroy
  end

  private

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit(:name, :email, :password, :password_confirmation, :registration_number, :route)
  end
  def authenticate_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      redirect_to login_url, alert: 'Please log in to continue'
    end
  end
end
