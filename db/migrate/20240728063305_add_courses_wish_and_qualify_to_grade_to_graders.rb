class AddCoursesWishAndQualifyToGradeToGraders < ActiveRecord::Migration[7.1]
  def change
    add_column :graders, :courses_wish_and_qualify_to_grade, :text
  end
end
