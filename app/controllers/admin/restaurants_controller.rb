class Admin::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all # @restaurants = current_user.restaurants
  end
end
