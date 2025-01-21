class Instructor < ApplicationRecord
  # query_constraints [:class_number, :course_id,:id]
  # query_constraints :class_number, :course_id
  belongs_to :course, primary_key: :courseId, class_name: "Course",foreign_key: "course_id"
  belongs_to :section,  query_constraints: [:class_number, :course_id]

  # belongs_to :course, primary_key: :courseId, class_name: "Course",foreign_key: "course_id", dependent: :destroy
  # belongs_to :section,-> { where self.find_by(course_id: :course_id) }, primary_key: :class_number, class_name: "Section", foreign_key: "class_number",  dependent: :destroy
  validates :email, presence: true
  validates :class_number, uniqueness: {scope: :course_id}
end
