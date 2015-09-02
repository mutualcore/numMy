class IngredientsController < ApplicationController
	def new
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.new(ingredient_params)
		if @ingredient.save
			redirect_to ingredients_path
		else
			flash[:error] = "Error saving ingredient"
		end
	end

	def index
		@ingredients = Ingredient.all
	end

	def destroy
		@ingredient = Ingredient.find(params[:id])
		if @ingredient.destroy
			redirect_to ingredients_path
		else
			flash[:error] = "Error deleting ingredient"
		end
	end

	private

	def ingredient_params
		params.require(:ingredient).permit(:name)
	end
end
