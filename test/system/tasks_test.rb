require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase

  test "viewing the index" do
    visit tasks_path
    assert_selector "h1", text: "Tasks"
  end

  # setup do
  #   @user = users(:one)
  #   # sign_in @user
  # end

  # test "creating a new task" do
  #   visit new_task_path

  #   fill_in "Title", with: "New Task"
  #   fill_in "Content", with: "Task content goes here"
  #   fill_in "Due date", with: "2024-03-15"
  #   click_on "Create Task"

  #   assert_text "Task created successfully"
  # end

  # test "updating a task" do
  #   task = tasks(:one)
  #   visit edit_task_path(task)

  #   fill_in "Title", with: "Updated Task"
  #   fill_in "Content", with: "Updated task content"
  #   click_on "Update Task"

  #   assert_text "Task updated successfully"
  # end

  # test "deleting a task" do
  #   task = tasks(:one)
  #   visit tasks_path

  #   accept_confirm do
  #     click_on "Delete", match: :first
  #   end

  #   assert_text "Task deleted successfully"
  # end

end
