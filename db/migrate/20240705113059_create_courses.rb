class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.integer :courseId
      t.string :catalog_number
      t.string :title
      t.string :description
      t.string :short_description
      t.string :component
      t.string :term
      t.string :campus
      t.string :subject
      t.string :catalog_level

      t.timestamps
    end
  end
end
