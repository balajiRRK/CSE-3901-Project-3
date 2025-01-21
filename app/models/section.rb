class Section < ApplicationRecord
#  self.primary_key = :course_id, :class_number
  # Query constraints are being used because different courses may have the same class number so course_id is also used to filter out 
  # that when it happens
  query_constraints :class_number, :course_id
  belongs_to :course, primary_key: :courseId, foreign_key: "course_id", dependent: :destroy
  # The where part is to separate instructors where the class_number is the same, 
  # so the course_id check is added to make sure it's the instructor for the course.
  
  
  has_many :instructors, query_constraints: [:class_number, :course_id], dependent: :destroy
  has_many :assistants, query_constraints: [:class_number, :course_id], dependent: :destroy
  accepts_nested_attributes_for :assistants
  # has_many :assistants,-> { where self.find_by(course_id: :course_id) }, primary_key: :class_number, foreign_key: "class_number", dependent: :destroy
  # has_many :instructors, -> { where self.find_by(course_id: :course_id)  },primary_key: :class_number, foreign_key: "class_number",  dependent: :destroy

  
 # Validations for section
  validates :course_id, presence: true
  validates :catalog_number, presence: true
  validates :class_number, presence: true, uniqueness: true
  validates :component, presence: true
  validates :instruction_mode, presence: true
  validates :term, presence: true
end

