class RecipesController < ApplicationController
    def new
        @recipe = Recipe.new
        @kitchens = Kitchen.all
    end

    def create
        @recipe = Recipe.new recipe_params
        @recipe.save
        redirect_to @recipe
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def index
        @recipes = Recipe.all
        @kitchens = Kitchen.all
    end

    private

    def recipe_params
        params.require(:recipe).permit(
            :name, :kitchen_id, :typeFood, :numberPeopleServe,
            :preparationTime, :level, :ingredients, :steps, :picture
        )
    end
end
