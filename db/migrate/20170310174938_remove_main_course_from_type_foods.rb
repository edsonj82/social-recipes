class RemoveMainCourseFromTypeFoods < ActiveRecord::Migration[5.0]
  def change
    remove_column :type_foods, :main_course, :string
  end
end
