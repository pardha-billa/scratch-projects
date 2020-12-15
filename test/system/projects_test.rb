require 'application_system_test_case'

class ProjectsTest < ApplicationSystemTestCase


  test "CRUD activity" do
    sign_in users(:regular)
    visit projects_url
    assert_selector "h1", text: "Projects"
    click_on "Create"
    fill_in "Name", with: "FirstOne"
    fill_in "Description", with: "Test Description"
    click_on "Create Project"
    assert_text "Successfully Created"
    click_on "FirstOne"
    click_on "Edit"
    fill_in "Name", with: "Crud"
    fill_in "Description", with: "Hello from test"
    click_on "Update Project"
    assert_selector "p", text: "Hello from test"
    click_on "Delete"
    click_on "Confirm"
    assert_text "Project was deleted Successfully"
  end
end
