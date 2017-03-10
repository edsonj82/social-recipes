class AddTypeFoodRefToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :type_food, foreign_key: true
  end
end
