class RemoveLnameFromInstructors < ActiveRecord::Migration[7.1]
  def change
    remove_column :instructors, :lname, :string
  end
end
