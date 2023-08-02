class AdminsController < ApplicationController
    before_action :authenticate_user
    before_action :set_admin, only: [:show, :update, :destroy]
  
    # GET /admins
    def index
      @admins = Admin.all
      render json: @admins
    end
  
    # GET /admins/:id
    def show
      render json: @admin
    end
  
    # POST /admins
    def create
      @admin= Admin.new(admin_params)
  
      if @admin.save
        render json: @admin, status: :created
      else
        render json: @admin.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /drivers/:id
    def update
      if @admin.update(driver_params)
        render json: @admin
      else
        render json: @admin.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /drivers/:id
    def destroy
      @admin.destroy
    end
  
    private
  
    def set_admin
      @admin = Admin.find(params[:id])
    end
  
    def driver_params
      params.require(:admin).permit(:name, :email, :password)
    end
end
