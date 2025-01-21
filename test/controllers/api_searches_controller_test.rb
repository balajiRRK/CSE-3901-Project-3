require "test_helper"

class ApiSearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_search = api_searches(:one)
  end

  test "should get index" do
    get api_searches_url
    assert_response :success
  end

  test "should get new" do
    get new_api_search_url
    assert_response :success
  end

  test "should create api_search" do
    assert_difference("ApiSearch.count") do
      post api_searches_url, params: { api_search: { academic_career: @api_search.academic_career, campus: @api_search.campus, catalog_level: @api_search.catalog_level, catalog_number: @api_search.catalog_number, component: @api_search.component, course_id: @api_search.course_id, evening: @api_search.evening, instruction_mode: @api_search.instruction_mode, search: @api_search.search, subject: @api_search.subject, term: @api_search.term } }
    end

    assert_redirected_to api_search_url(ApiSearch.last)
  end

  test "should show api_search" do
    get api_search_url(@api_search)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_search_url(@api_search)
    assert_response :success
  end

  test "should update api_search" do
    patch api_search_url(@api_search), params: { api_search: { academic_career: @api_search.academic_career, campus: @api_search.campus, catalog_level: @api_search.catalog_level, catalog_number: @api_search.catalog_number, component: @api_search.component, course_id: @api_search.course_id, evening: @api_search.evening, instruction_mode: @api_search.instruction_mode, search: @api_search.search, subject: @api_search.subject, term: @api_search.term } }
    assert_redirected_to api_search_url(@api_search)
  end

  test "should destroy api_search" do
    assert_difference("ApiSearch.count", -1) do
      delete api_search_url(@api_search)
    end

    assert_redirected_to api_searches_url
  end
end
