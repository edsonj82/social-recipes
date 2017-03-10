class CreateTypeFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :type_foods do |t|
      t.string :breakfast
      t.string :side_dish
      t.string :starter
      t.string :main_course
      t.string :dessert

      t.timestamps
    end
  end
end
