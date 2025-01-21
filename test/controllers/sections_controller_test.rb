require "test_helper"

class SectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:one)
  end

  test "should get index" do
    get sections_url
    assert_response :success
  end

  test "should get new" do
    get new_section_url
    assert_response :success
  end

  test "should create section" do
    assert_difference("Section.count") do
      post sections_url, params: { section: { catalog_number: @section.catalog_number, class_number: @section.class_number, component: @section.component, course_id: @section.course_id, end_date: @section.end_date, end_time: @section.end_time, facility_description: @section.facility_description, facility_id: @section.facility_id, friday: @section.friday, instruction_mode: @section.instruction_mode, instructor: @section.instructor, instructor_email: @section.instructor_email, instructor_role: @section.instructor_role, monday: @section.monday, room: @section.room, saturday: @section.saturday, section: @section.section, start_date: @section.start_date, start_time: @section.start_time, sunday: @section.sunday, term: @section.term, thursday: @section.thursday, tuesday: @section.tuesday, wednesday: @section.wednesday } }
    end

    assert_redirected_to section_url(Section.last)
  end

  test "should show section" do
    get section_url(@section)
    assert_response :success
  end

  test "should get edit" do
    get edit_section_url(@section)
    assert_response :success
  end

  test "should update section" do
    patch section_url(@section), params: { section: { catalog_number: @section.catalog_number, class_number: @section.class_number, component: @section.component, course_id: @section.course_id, end_date: @section.end_date, end_time: @section.end_time, facility_description: @section.facility_description, facility_id: @section.facility_id, friday: @section.friday, instruction_mode: @section.instruction_mode, instructor: @section.instructor, instructor_email: @section.instructor_email, instructor_role: @section.instructor_role, monday: @section.monday, room: @section.room, saturday: @section.saturday, section: @section.section, start_date: @section.start_date, start_time: @section.start_time, sunday: @section.sunday, term: @section.term, thursday: @section.thursday, tuesday: @section.tuesday, wednesday: @section.wednesday } }
    assert_redirected_to section_url(@section)
  end

  test "should destroy section" do
    assert_difference("Section.count", -1) do
      delete section_url(@section)
    end

    assert_redirected_to sections_url
  end
end
