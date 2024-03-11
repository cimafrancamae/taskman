require "test_helper"

class TasksIntegrationTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "the truth" do
    assert true
  end

  setup do
    @user = users(:one)
    @category = categories(:one)
    sign_in @user
  end

  test "creating a new task" do
    get new_task_path
    assert_response :success

    assert_difference("Task.count") do
      post tasks_path, params: { task: { title: "New Task", description: "Task Description", due_date: Date.tomorrow, completed: false, category_id: @category.id }}
    end

    assert_redirected_to tasks_path
    follow_redirect!

    assert_select "div", "Task saved successfully."
  end

  test "updating a task" do
    task = tasks(:one)
    get edit_task_path(task)
    assert_response :success

    patch task_path(task), params: { task: { title: "Updated Task", description: "Updated Description", due_date: Date.tomorrow, completed: true, category_id: @category.id }}

    assert_redirected_to tasks_path
    follow_redirect!

    assert_select "div", "Task updated successfully."
  end

  test "destroying a task" do
    task = tasks(:one)

    assert_difference("Task.count", -1) do
      delete task_path(task)
    end

    assert_redirected_to tasks_path
    follow_redirect!

    assert_select "div", "Task deleted successfully."
  end
end
