class InstrumentsController < ApplicationController

  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
    @bookings = @instrument.bookings
    @reviews = @instrument.reviews
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instruments_params)
    @instrument.user_id = current_user.id
    if @instrument.save
      redirect_to @instrument
    else
      render :new
    end
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.delete
    redirect_to instruments_path
  end

  private

  def instruments_params
    params.require(:instrument).permit(:name, :description, :user_id, :price_per_day)
  end

end
