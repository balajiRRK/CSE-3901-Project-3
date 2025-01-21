require "application_system_test_case"

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:one)
  end

  test "visiting the index" do
    visit sections_url
    assert_selector "h1", text: "Sections"
  end

  test "should create section" do
    visit sections_url
    click_on "New section"

    fill_in "Catalog number", with: @section.catalog_number
    fill_in "Class number", with: @section.class_number
    fill_in "Component", with: @section.component
    fill_in "Course", with: @section.course_id
    fill_in "End date", with: @section.end_date
    fill_in "End time", with: @section.end_time
    fill_in "Facility description", with: @section.facility_description
    fill_in "Facility", with: @section.facility_id
    check "Friday" if @section.friday
    fill_in "Instruction mode", with: @section.instruction_mode
    fill_in "Instructor", with: @section.instructor
    fill_in "Instructor email", with: @section.instructor_email
    fill_in "Instructor role", with: @section.instructor_role
    check "Monday" if @section.monday
    fill_in "Room", with: @section.room
    check "Saturday" if @section.saturday
    fill_in "Section", with: @section.section
    fill_in "Start date", with: @section.start_date
    fill_in "Start time", with: @section.start_time
    check "Sunday" if @section.sunday
    fill_in "Term", with: @section.term
    check "Thursday" if @section.thursday
    check "Tuesday" if @section.tuesday
    check "Wednesday" if @section.wednesday
    click_on "Create Section"

    assert_text "Section was successfully created"
    click_on "Back"
  end

  test "should update Section" do
    visit section_url(@section)
    click_on "Edit this section", match: :first

    fill_in "Catalog number", with: @section.catalog_number
    fill_in "Class number", with: @section.class_number
    fill_in "Component", with: @section.component
    fill_in "Course", with: @section.course_id
    fill_in "End date", with: @section.end_date
    fill_in "End time", with: @section.end_time
    fill_in "Facility description", with: @section.facility_description
    fill_in "Facility", with: @section.facility_id
    check "Friday" if @section.friday
    fill_in "Instruction mode", with: @section.instruction_mode
    fill_in "Instructor", with: @section.instructor
    fill_in "Instructor email", with: @section.instructor_email
    fill_in "Instructor role", with: @section.instructor_role
    check "Monday" if @section.monday
    fill_in "Room", with: @section.room
    check "Saturday" if @section.saturday
    fill_in "Section", with: @section.section
    fill_in "Start date", with: @section.start_date
    fill_in "Start time", with: @section.start_time
    check "Sunday" if @section.sunday
    fill_in "Term", with: @section.term
    check "Thursday" if @section.thursday
    check "Tuesday" if @section.tuesday
    check "Wednesday" if @section.wednesday
    click_on "Update Section"

    assert_text "Section was successfully updated"
    click_on "Back"
  end

  test "should destroy Section" do
    visit section_url(@section)
    click_on "Destroy this section", match: :first

    assert_text "Section was successfully destroyed"
  end
end
