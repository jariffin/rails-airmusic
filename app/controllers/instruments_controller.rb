class InstrumentsController < ApplicationController

  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
    @bookings = @instrument.bookings
  end

  def new

  end

  def create

  end

  def destroy

  end

  private

  def instruments_params

  end

end
