require "test_helper"

class GradersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assistant = assistants(:one)
  end

  test "should get index" do
    get graders_url
    assert_response :success
  end

  test "should get new" do
    get new_grader_url
    assert_response :success
  end

  test "should create grader" do
    assert_difference("Assistant.count") do
      post graders_url, params: { grader: { email: @assistant.email, fname: @assistant.fname, lname: @assistant.lname } }
    end

    assert_redirected_to grader_url(Assistant.last)
  end

  test "should show grader" do
    get grader_url(@assistant)
    assert_response :success
  end

  test "should get edit" do
    get edit_grader_url(@assistant)
    assert_response :success
  end

  test "should update grader" do
    patch grader_url(@assistant), params: { grader: { email: @assistant.email, fname: @assistant.fname, lname: @assistant.lname } }
    assert_redirected_to grader_url(@assistant)
  end

  test "should destroy grader" do
    assert_difference("Assistant.count", -1) do
      delete grader_url(@assistant)
    end

    assert_redirected_to graders_url
  end
end
