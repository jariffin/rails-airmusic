class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @instrument = Instrument.find(params[:instrument_id])
  end

  def create
    @review = Review.new(reviews_params)
    @instrument = Instrument.find(params[:instrument_id])
    @review.user_id = current_user.id
    @review.instrument_id = @instrument.id
    if @review.save
      flash[:notice] = "Thank you for your review!"
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to instrument_path(@review.instrument)
  end

  private

  def reviews_params
    params.require(:review).permit(:content)
  end

end
