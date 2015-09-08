class RecipesController < ApplicationController
  def index
  	@ingredients = []
  	Ingredient.all.each do |i|
  		@ingredients << i[:name]
  	end
  	@recipes = []
   	@ingredients.each do |i|
   		@recipes << Yummly.search(i)["matches"] unless @recipes.include?(Yummly.search(i)["matches"])
   	end
   	staples = ["extra-virgin olive oil", "olive oil", "oil", "salt", "water", "pepper", "kosher salt", "ground black pepper", "milk", "butter", "salted butter", "unsalted butter", "sea salt", "honey", "sugar", "flour", "all-purpose flour", "skim milk", "basil", "brown sugar", "whole milk", "maple syrup"]
   	@my_kitchen = (staples + @ingredients)
   	@final = []
   	@recipes.each do |r|
   		r.each do |r|
	   		if r["ingredients"].all? {|i| @my_kitchen.include?(i)}
	   			@final << r
	   		end
	   	end
   	end
   	@final.uniq!
  end
end
