class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.experience = @experience
    if @booking.save
      redirect_to experience_path(@experience)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_experience

  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
