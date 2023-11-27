class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end
  
  def update
    require 'pry'; binding.pry
    @dish = Dish.find(params[:id])
  end


  # private

  # def dish_params
  #   params.permit(:)
  # end
end