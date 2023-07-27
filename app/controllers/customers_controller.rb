# app/controllers/customers_controller.rb

class CustomersController < ApplicationController
  before_action :authenticate_user
  before_action :set_customer, only: [:show, :update, :destroy]

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PUT /customers/:id
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation, booking_ids: [])
  end
end
