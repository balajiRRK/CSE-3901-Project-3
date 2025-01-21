class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invite_student.subject
  #
  def invite_student(email, course = nil)
    @course = course

    mail(to: email, subject: "Invitation to join the class")
  end
end
