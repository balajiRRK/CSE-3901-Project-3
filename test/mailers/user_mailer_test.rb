require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "invite_student" do
    mail = UserMailer.invite_student
    assert_equal "Invite student", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
