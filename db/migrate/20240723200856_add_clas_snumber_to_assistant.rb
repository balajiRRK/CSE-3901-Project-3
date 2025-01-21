class AddClasSnumberToAssistant < ActiveRecord::Migration[7.1]
  def change
    add_column :assistants, :class_number, :integer
  end
end
