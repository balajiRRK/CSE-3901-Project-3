require "application_system_test_case"

class ApiSearchesTest < ApplicationSystemTestCase
  setup do
    @api_search = api_searches(:one)
  end

  test "visiting the index" do
    visit api_searches_url
    assert_selector "h1", text: "Api searches"
  end

  test "should create api search" do
    visit api_searches_url
    click_on "New api search"

    fill_in "Academic career", with: @api_search.academic_career
    fill_in "Campus", with: @api_search.campus
    fill_in "Catalog level", with: @api_search.catalog_level
    fill_in "Catalog number", with: @api_search.catalog_number
    fill_in "Component", with: @api_search.component
    fill_in "Course", with: @api_search.course_id
    fill_in "Evening", with: @api_search.evening
    fill_in "Instruction mode", with: @api_search.instruction_mode
    fill_in "Search", with: @api_search.search
    fill_in "Subject", with: @api_search.subject
    fill_in "Term", with: @api_search.term
    click_on "Create Api search"

    assert_text "Api search was successfully created"
    click_on "Back"
  end

  test "should update Api search" do
    visit api_search_url(@api_search)
    click_on "Edit this api search", match: :first

    fill_in "Academic career", with: @api_search.academic_career
    fill_in "Campus", with: @api_search.campus
    fill_in "Catalog level", with: @api_search.catalog_level
    fill_in "Catalog number", with: @api_search.catalog_number
    fill_in "Component", with: @api_search.component
    fill_in "Course", with: @api_search.course_id
    fill_in "Evening", with: @api_search.evening
    fill_in "Instruction mode", with: @api_search.instruction_mode
    fill_in "Search", with: @api_search.search
    fill_in "Subject", with: @api_search.subject
    fill_in "Term", with: @api_search.term
    click_on "Update Api search"

    assert_text "Api search was successfully updated"
    click_on "Back"
  end

  test "should destroy Api search" do
    visit api_search_url(@api_search)
    click_on "Destroy this api search", match: :first

    assert_text "Api search was successfully destroyed"
  end
end
