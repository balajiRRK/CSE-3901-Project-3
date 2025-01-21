class CreateApiSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :api_searches do |t|
      t.string :search
      t.string :term
      t.string :campus
      t.string :academic_career
      t.string :catalog_number
      t.string :catalog_level
      t.string :component
      t.string :subject
      t.string :instruction_mode
      t.string :evening
      t.integer :course_id

      t.timestamps
    end
  end
end
