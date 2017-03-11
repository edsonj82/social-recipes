class RemoveStarterFromTypeFoods < ActiveRecord::Migration[5.0]
  def change
    remove_column :type_foods, :starter, :string
  end
end
