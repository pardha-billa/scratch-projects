require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = users(:regular)
    sign_in user
  end
  test "can't access without login to the application" do
    sign_out User
    get projects_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "visit index" do
    get projects_url
    assert @controller.view_assigns['projects']
    assert_response :success
  end

  test "Can visit new" do
    get new_project_url
    assert @controller.view_assigns['project']
    assert_response :success
  end

  test "Can create Project with valid params" do
    assert_difference("Project.count") do
      post projects_url, params: {project: {name: "crud", description: "Just CRUD operations without scaffold"}}
      assert_response :redirect
    end
  end
  test "Can not create Project with invalid params" do
    assert_no_difference("Project.count") do
      post projects_url, params: {project: {description: "Just CRUD operations without scaffold"}}
    end
  end

  test "Can get edit page" do
    get edit_project_url(projects(:one))
    assert @controller.view_assigns['project']
    assert_response :success
  end

  test "Can upadate the project" do
    project = projects(:one)
    patch project_url(project), params: {project: {name: "updated name", description: "Updated description"}} do
      assert_equal project.name, "updated name"
      assert_response :success
    end
  end

  test " Can delete a project"  do
    project = projects(:one)
    assert_difference('Project.count',-1) do 
      delete project_url(project)
    end
  end
end

