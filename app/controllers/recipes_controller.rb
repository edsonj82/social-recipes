class RecipesController < ApplicationController
    def new
        @recipe = Recipe.new
        @kitchens = Kitchen.all
        @type_foods = TypeFood.all
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
        @type_foods = TypeFood.all
        @recipes = Recipe.most_recent.limit(20)
    end

    private

    def recipe_params
        params.require(:recipe).permit(
            :name, :kitchen_id, :type_food_id, :numberPeopleServe,
            :preparationTime, :level, :ingredients, :steps, :picture
        )
    end
end
