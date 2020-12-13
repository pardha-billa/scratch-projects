require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "Invalid without name" do
    project = Project.new
    project.valid?
    assert project.errors.any?
  end
  test "Invalid without description " do
    project = Project.new(name: 'abc')
    project.valid?
    assert project.errors.any?
  end
  test "Valid with name and description " do
    project = Project.new(name: 'abc', description: 'xxxx')
    project.valid?
    assert_empty project.errors
  end

  test "minimum length of the name is two characters" do
    project = Project.new(name: "a", description: "xxx")
    project.valid?
    assert project.errors.full_messages.include? "Name must have atleast two characters"
  end
  test "maximum length of the name is 8 characters" do
    project = Project.new(name: "abcdefghi", description: "xxx")
    project.valid?
    assert project.errors.full_messages.include? "Name should not have more than 8 characters"
  end

  test "name should contains only alphabets" do
    project = Project.new(name: "13", description: "xxx")
    project.valid?
    assert project.errors.full_messages.include? "Name should not contain any numeric values"
  end
end
