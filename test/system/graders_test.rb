require "application_system_test_case"

class GradersTest < ApplicationSystemTestCase
  setup do
    @assistant = assistants(:one)
  end

  test "visiting the index" do
    visit graders_url
    assert_selector "h1", text: "Graders"
  end

  test "should create grader" do
    visit graders_url
    click_on "New grader"

    fill_in "Email", with: @assistant.email
    fill_in "Fname", with: @assistant.fname
    fill_in "Lname", with: @assistant.lname
    click_on "Create Assistant"

    assert_text "Assistant was successfully created"
    click_on "Back"
  end

  test "should update Assistant" do
    visit grader_url(@assistant)
    click_on "Edit this grader", match: :first

    fill_in "Email", with: @assistant.email
    fill_in "Fname", with: @assistant.fname
    fill_in "Lname", with: @assistant.lname
    click_on "Update Assistant"

    assert_text "Assistant was successfully updated"
    click_on "Back"
  end

  test "should destroy Assistant" do
    visit grader_url(@assistant)
    click_on "Destroy this grader", match: :first

    assert_text "Assistant was successfully destroyed"
  end
end
