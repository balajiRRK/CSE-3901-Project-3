# The sources used for this file vary, including ChatGPT and Carmen resources:
# https://www.youtube.com/playlist?list=PLlxmoA0rQ-Lx45j3D6da7-Iqvo5wtjKBm
# https://www.youtube.com/playlist?list=PLS1QulWo1RIbNBXZAeVbkkHEj9zsEbXQK
# https://www.railstutorial.org/book
# https://www.youtube.com/watch?v=GY7Ps8fqGdc
# https://chatgpt.com/

class Recommendation < ApplicationRecord
  belongs_to :instructor, class_name: 'User'
  belongs_to :student, class_name: 'User', optional: true
  belongs_to :course, optional: true

  validates :notes, presence: true  #validate notes
  validates :student_email, presence: true, format: { with: /\A[a-zA-Z]+\.[0-9]+@osu\.edu\z/i, message: 'must be an OSU email: lastname.#@osu.edu' }  #validate student email
  validates :recommendation_type, presence: true  #validate recommendation type
  validates :course_id, presence: true, format: { with: /\A[0-9]{4}\z/, message: 'should be a 4 digit course id' }  #validate instructor id
end
