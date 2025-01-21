class AddCourseIdToInstructors < ActiveRecord::Migration[7.1]
  def change
    add_column :instructors, :course_id, :string
  end
end
