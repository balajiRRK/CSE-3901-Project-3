class AddDetailsToGraders < ActiveRecord::Migration[7.1]
  def change
    add_column :graders, :contact_info, :string
    add_column :graders, :courses_wish_to_grade, :text
    add_column :graders, :courses_qualified_to_grade, :text
  end
end
