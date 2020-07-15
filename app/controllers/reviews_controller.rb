class ReviewsController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@review.cocktail)
    else
      @dose = Dose.new
      render "cocktails/show"
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating, :cocktail_id)
  end
end
