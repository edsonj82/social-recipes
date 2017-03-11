class RemoveDessertFromTypeFoods < ActiveRecord::Migration[5.0]
  def change
    remove_column :type_foods, :dessert, :string
  end
end
