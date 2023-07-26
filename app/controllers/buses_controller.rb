class BusesController < ApplicationController
  before_action :authenticate_user
  before_action :set_bus, only: [:show, :update, :destroy]

  # GET /buses
  def index
    @buses = Bus.all
    render json: @buses
  end

  # GET /buses/:id
  def show
    render json: @bus
  end

  # POST /buses
  def create
    @bus = Bus.new(bus_params)

    if @bus.save
      render json: @bus, status: :created
    else
      render json: @bus.errors, status: :unprocessable_entity
    end
  end

  # PUT /buses/:id
  def update
    if @bus.update(bus_params)
      render json: @bus
    else
      render json: @bus.errors, status: :unprocessable_entity
    end
  end

  # DELETE /buses/:id
  def destroy
    @bus.destroy
  end

  # GET /buses/search_by_route/:search_query
  def search_by_route
    search_query = params[:search_query]

    if search_query.present?
      @buses = Bus.where('lower(route) LIKE ?', "%#{search_query.downcase}%")
      render json: @buses
    else
      render json: { error: 'Search query cannot be empty.' }, status: :unprocessable_entity
    end
  end

  private

  def set_bus
    @bus = Bus.find(params[:id])
  end

  def bus_params
    params.require(:bus).permit(:number_of_seats, :cost_per_seat, :route, :time_of_travel, :driver_id, :registration_number)
  end
end
