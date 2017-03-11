class RemoveSideDishFromTypeFoods < ActiveRecord::Migration[5.0]
  def change
    remove_column :type_foods, :side_dish, :string
  end
end
