require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase

  setup do
    @user = users(:one)
    @category = categories(:one)
    login_as(@user, scope: :user)
  end

  test "viewing the index" do
    visit tasks_path
    assert_selector "h1", text: "Tasks"
  end

  test "creating a new task" do
    visit new_task_path

    fill_in "Title", with: "New Task"
    fill_in "Due date", with: "2024-03-15"
    select "1", from: "task_category_id"
    find("#task_content").set("New value")
    click_on "Create Task"

    assert_text "Task saved successfully."
  end

  test "updating a task" do
    task = tasks(:one)
    visit edit_task_path(task)

    fill_in "Title", with: "Updated Task"
    fill_in "Due date", with: Date.today
    find("#task_content").set("Updated task content")
    click_on "Update Task"

    assert_text "Task updated successfully."
  end

  test "deleting a task" do
    task = tasks(:one)
    visit tasks_path

    accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Task deleted successfully."
  end

end
