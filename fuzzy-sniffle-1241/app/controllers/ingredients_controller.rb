class IngredientsController < ApplicationController
  def index
    @chefs = Chef.find(params[:chef_id])
    @ingredients = Ingredient.all
    # 
  end
  
end