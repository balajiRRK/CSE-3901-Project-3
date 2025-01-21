class CreateRecommendations < ActiveRecord::Migration[7.1]
  def change
    create_table :recommendations do |t|
      t.integer :instructor_id
      t.string :student_email
      t.integer :course_id
      t.string :recommendation_type
      t.text :notes

      t.timestamps
    end
  end
end
