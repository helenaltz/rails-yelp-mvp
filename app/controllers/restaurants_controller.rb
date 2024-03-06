class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    id = params[:id]
    @restaurant = Restaurant.find(id)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurants)
    @restaurant.save!
    redirect_to restaurant_path(@restaurant)
  end

  private

  def params_restaurants
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
