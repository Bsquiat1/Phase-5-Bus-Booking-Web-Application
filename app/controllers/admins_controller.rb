# app/controllers/admins_controller.rb
class AdminsController < ApplicationController
  # before_action :authorize_request
  # before_action :set_admin, only: [:show, :update, :destroy]

  def index
    @admins = Admin.all
    render json: @admins
  end

  def show
    render json: @admin
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      render json: @admin, status: :created
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  def update
    if @admin.update(admin_params)
      render json: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @admin.destroy
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:name, :email, :password_digest)
  end
end
