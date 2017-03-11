class RemoveBreakfastFromTypeFoods < ActiveRecord::Migration[5.0]
  def change
    remove_column :type_foods, :breakfast, :string
  end
end
