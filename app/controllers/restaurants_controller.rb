class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :chef]

  def chef
  end

  # GET /restaurants/top
  def top
    @top_restaurants = Restaurant.where(stars: 5)
  end

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/:id
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/:id/edit
  def edit
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save # for validation, it redirects just if the params are valid and the restaurant is saved in the db
      redirect_to root_path
    else
      render :new # render the new template again, not with a new request
    end
  end

  # PATCH /restaurants/:id
  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  # DELETE /restaurants/:id
  def destroy
    @restaurant.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust external parameters, only allow the white list through
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :description, :stars)
    end
end
