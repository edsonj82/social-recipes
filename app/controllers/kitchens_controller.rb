class KitchensController < ApplicationController
    def new
        @kitchen = Kitchen.new
    end

    def create
        @kitchen = Kitchen.new(params.require(:kitchen).permit(:name))
        @kitchen.save
        redirect_to @kitchen
    end

    def show
        @kitchen = Kitchen.find(params[:id])
    end
end
