class ReviewsController < ApplicationController
  before_action :set_restaurant

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params) # another way: `@review = @restaurant.reviews.build(review_params)`
    @review.restaurant = @restaurant # links the review to the restaurant
    @review.save
    redirect_to root_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id]) # :restaurant_id because :id is assigned to the review
  end


  def review_params
    params.require(:review).permit(:content) # strong params
  end
end
