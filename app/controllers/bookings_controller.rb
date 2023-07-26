class BookingsController < ApplicationController
  before_action :authenticate_user
  before_action :set_booking, only: [:show, :update, :destroy]

  # GET /bookings
  def index
    @bookings = Booking.all
    render json: @bookings
  end

  # GET /bookings/:id
  def show
    render json: @booking
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # PUT /bookings/:id
  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookings/:id
  def destroy
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:seat_number, :customer_id, :bus_id)
  end
end
