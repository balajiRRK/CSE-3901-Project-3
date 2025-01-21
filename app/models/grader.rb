class Grader < ApplicationRecord
  belongs_to :user, primary_key: :email, foreign_key: :email

  enum verdict: { denied: "denied", pending: "pending", allowed: "allowed" }
  # Existing validations
  validate :name_check
  validate :email_check
  validate :phone_number_check
  validates :courses_wish_and_qualify_to_grade, presence: true

  # New validation for availability
  validate :availability_present

  # # Serialize availability as a Hash using JSON encoding
  # serialize :availability, Hash, coder: JSON

  # Define days of the week for availability
  DAYS_OF_WEEK = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]

  def Grader
    def to_param
      email
    end
  end

  # Existing custom validations
  def name_check
    unless name =~ /^[a-z ,.'-]+$/i
      errors.add(:name, "should be a valid name")
    end
  end

  def email_check
    unless email =~ /\A[a-zA-Z]+\.[0-9]+@osu\.edu\z/i
      errors.add(:email, "should be a [lastname].[number]@osu.edu email address")
    end
  end

  def phone_number_check
    unless phone_number =~ /^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/i
      errors.add(:phone_number, "should be a valid phone number (ex: ###-###-####)")
    end
  end

  private

  # Custom validation method for availability
  def availability_present
    time_present = false

    # Make sure each day available day pair must have a time
    !monday_start.blank? == true && !monday_end.blank? == true ? time_present = true : time_present
    !tuesday_start.blank? == true && !tuesday_end.blank? == true ? time_present = true : time_present
    !wednesday_start.blank? == true && !wednesday_end.blank? == true ? time_present = true : time_present
    !thursday_start.blank? == true && !thursday_end.blank? == true ? time_present = true : time_present
    !friday_start.blank? == true && !friday_end.blank? == true ? time_present = true : time_present
    !saturday_start.blank? == true && !saturday_end.blank? == true ? time_present = true : time_present
    !sunday_start.blank? == true && !sunday_end.blank? == true ? time_present = true : time_present

    errors.add(:time_present, "must have at least one day with times set") unless time_present == true
  end
end
