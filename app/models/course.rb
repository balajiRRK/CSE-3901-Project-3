class Course < ApplicationRecord
  # a course may have many sectionsS
  has_many :sections, primary_key: :courseId,foreign_key: "course_id", dependent: :destroy
  has_many :assistants, primary_key: :courseId, foreign_key: "course_id", dependent: :destroy
  has_many :instructors, primary_key: :courseId, foreign_key: "course_id", dependent: :destroy
  has_many :recommendations, dependent: :destroy
  accepts_nested_attributes_for :assistants
  # Validations for course
  validates :courseId, presence: true, uniqueness: { scope: :courseId }
  validates :catalog_number, presence: true
  validates :title, presence: true
  validates :description, presence: true
#   validates :short_Description, presence: true
validates :component, presence: true
validates :term, presence: true
validates :campus, presence: true
validates :subject, presence: true

# Ensure that the course ID is unique per term
validates :courseId, uniqueness: { scope: :term }
end
