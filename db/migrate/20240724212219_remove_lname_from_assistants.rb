class RemoveLnameFromAssistants < ActiveRecord::Migration[7.1]
  def change
    remove_column :assistants, :lname, :string
  end
end
