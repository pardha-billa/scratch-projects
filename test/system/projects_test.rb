require 'application_system_test_case'

class ProjectsTest < ApplicationSystemTestCase


  test "visiting index" do
    sign_in users(:regular)
    project = projects(:one)
    visit projects_url
    assert_selector "h1", text: "Projects"
    click_on project.name 
  end
end
