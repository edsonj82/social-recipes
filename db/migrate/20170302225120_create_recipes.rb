class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :kitchen
      t.string :typeFood
      t.string :numberPeopleServe
      t.string :preparationTime
      t.string :level
      t.string :ingredients
      t.string :steps

      t.timestamps
    end
  end
end
