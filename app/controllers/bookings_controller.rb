class BookingsController < ApplicationController

  def show
  end

  def new
    @booking = Booking.new
    @instrument = Instrument.find(params[:instrument_id])
  end

  def create
    @booking = Booking.new(bookings_params)
    @instrument = Instrument.find(params[:instrument_id])
    @booking.instrument = @instrument
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  def destroy

  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
