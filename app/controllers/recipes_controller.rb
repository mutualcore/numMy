class RecipesController < ApplicationController
  def index
  	@recipes = Yummly.search(Ingredient.first.name)
  end
end
