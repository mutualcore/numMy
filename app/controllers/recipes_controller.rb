class RecipesController < ApplicationController
  def index
  	@my_kitchen = []
  	Ingredient.all.each do |i|
  		@my_kitchen << i[:name]
  	end
  	@recipes = []
   	@my_kitchen.each do |i|
   		@recipes << Yummly.search(i)["matches"]
   	end
  end
end
