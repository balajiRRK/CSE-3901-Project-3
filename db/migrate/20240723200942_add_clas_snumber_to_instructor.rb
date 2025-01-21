class AddClasSnumberToInstructor < ActiveRecord::Migration[7.1]
  def change
    add_column :instructors, :class_number, :integer
  end
end
