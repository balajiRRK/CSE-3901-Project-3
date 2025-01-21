class AddCourseIdToGraders < ActiveRecord::Migration[7.1]
  def change
    add_column :assistants, :course_id, :string
  end
end
