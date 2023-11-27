class FoodsController < ApplicationController
  def show
    @searched_food = params[:q]
    @foods = FoodFacade.food_search(@searched_food)
  end
end