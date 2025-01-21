class AddAvailabilityToGraders < ActiveRecord::Migration[7.1]
  def change
    # Add availability column as text to store serialized hash
    add_column :graders, :availability, :text
  end
end