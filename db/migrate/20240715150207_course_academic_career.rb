class CourseAcademicCareer < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :academic_career, :string
  end
end
