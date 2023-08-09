class BusesController < ApplicationController
  include ActionController::Cookies
  # before_action :set_bus, only: [:show, :update, :destroy]
 
  def index
    @buses = Bus.all
    render json: @buses
  end

  def show
    render json: @bus
  end

  def create
    @bus = Bus.new(bus_params)

    if @bus.save
      render json: @bus, status: :created
    else
      render json: @bus.errors, status: :unprocessable_entity
    end
  end

  def update
    if @bus.update(bus_params)
      render json: @bus
    else
      render json: @bus.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bus.destroy
  end

  private

  def set_bus
    @bus = Bus.find(params[:id])
  end

  def bus_params
    params.require(:bus).permit(:number_of_seats, :cost_per_seat, :route, :time_of_travel, :registration_number,:driver_id)
  end
end