class BookingsController < ApplicationController
  before_action :set_experience, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.experience = @experience
    @booking.user = current_user

    # find all the bookings with the same experience as the one we're trying to create the booking for
    # loop over the booking that we find
    # check if the starting date overlaps the new one we are trying to create

    if @booking.save
      redirect_to experience_path(@experience), notice: "Booking Created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to experiences_path, status: :see_other
  end

  private

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end
end
