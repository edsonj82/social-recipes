class AddNameToTypeFood < ActiveRecord::Migration[5.0]
  def change
    add_column :type_foods, :name, :string
  end
end
