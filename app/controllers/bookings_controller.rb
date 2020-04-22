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
    @booking.instrument_id = @instrument.id
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to instrument_path(@booking.instrument)
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
