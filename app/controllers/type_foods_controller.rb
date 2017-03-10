class TypeFoodsController < ApplicationController
    def new
        @type_food = TypeFood.new
    end

    def create
        @type_food = TypeFood.new params_type_food
        @type_food.save
        redirect_to @type_food
    end

    def show
        @type_food = TypeFood.find(params[:id])
    end

    private

    def params_type_food
        params.require(:type_food).permit(:name)
    end
end
