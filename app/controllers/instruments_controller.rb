class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @instruments =  Instrument.global_search(params[:query])
    else
      # @instruments = Instrument.all
      @instruments = Instrument.geocoded # returns flats with coordinates
      @markers = @instruments.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude
        }
      end
    end
  end

  def show
    @bookings = @instrument.bookings
    @reviews = @instrument.reviews
  end

  def new
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @instrument = Instrument.new
    end
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

  def edit;end

  def update
    if current_user.nil?
      redirect_to new_user_session_path
    else @instrument.user_id = current_user.id
      if @instrument.update(instruments_params)
        redirect_to instrument_path(@instrument)
      else
        render :edit
      end
    end
  end

  def destroy
    @instrument.destroy
    redirect_to instruments_path
  end

  private

  def instruments_params
    params.require(:instrument).permit(:name, :description, :address, :photo, :location, :user_id, :price_per_day)
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

end
