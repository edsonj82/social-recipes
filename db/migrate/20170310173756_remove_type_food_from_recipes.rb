class RemoveTypeFoodFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :typeFood, :string
  end
end
