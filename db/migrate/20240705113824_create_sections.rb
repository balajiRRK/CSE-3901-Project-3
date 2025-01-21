class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.integer :course_id
      t.string :catalog_number
      t.integer :class_number
      t.string :component
      t.string :instruction_mode
      t.string :facility_id
      t.string :facility_description
      t.string :room
      t.string :start_time
      t.string :end_time
      t.string :start_date
      t.string :end_date
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.string :instructor
      t.string :instructor_role
      t.string :instructor_email
      t.string :term
      t.string :section

      t.timestamps
    end
  end
end
