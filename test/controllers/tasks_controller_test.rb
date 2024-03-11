require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @category = categories(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { title: 'New Task', description: 'Task description', due_date: Date.tomorrow, completed: false, category_id: @category.id } }
    end

    assert_redirected_to tasks_url
    assert_equal 'Task saved successfully.', flash[:notice]
  end

  test "should show task" do
    task = tasks(:one)
    get task_url(task)
    assert_response :success
  end

  test "should get edit" do
    task = tasks(:one)
    get edit_task_url(task)
    assert_response :success
  end

  test "should update task" do
    task = tasks(:one)
    patch task_url(task), params: { task: { title: 'Updated Task', due_date: Date.tomorrow } }
    assert_redirected_to tasks_url
    assert_equal 'Task updated successfully.', flash[:notice]
  end

  test "should destroy task" do
    task = tasks(:one)
    assert_difference('Task.count', -1) do
      delete task_url(task)
    end

    assert_redirected_to tasks_url
    assert_equal 'Task deleted successfully.', flash[:notice]
  end
end
