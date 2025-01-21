class AddVerdictToGrader < ActiveRecord::Migration[7.1]
  def change
    add_column :graders, :verdict, :string, default: :pending
  end
end
