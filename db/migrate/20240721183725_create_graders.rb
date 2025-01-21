class CreateGraders < ActiveRecord::Migration[7.1]
  def change
    create_table :graders do |t|
      t.string :name
      t.string :subject

      t.timestamps
    end
  end
end
