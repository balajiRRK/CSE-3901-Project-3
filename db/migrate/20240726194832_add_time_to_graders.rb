class AddTimeToGraders < ActiveRecord::Migration[7.1]
  def change
    add_column :graders, :monday_start, :string
    add_column :graders, :monday_end, :string
    add_column :graders, :tuesday_start, :string
    add_column :graders, :tuesday_end, :string
    add_column :graders, :wednesday_start, :string
    add_column :graders, :wednesday_end, :string
    add_column :graders, :thursday_start, :string
    add_column :graders, :thursday_end, :string
    add_column :graders, :friday_start, :string
    add_column :graders, :friday_end, :string
    add_column :graders, :saturday_start, :string
    add_column :graders, :saturday_end, :string
    add_column :graders, :sunday_start, :string
    add_column :graders, :sunday_end, :string
  end
end
