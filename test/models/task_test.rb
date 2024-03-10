require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  setup do
    @user = users(:one)
    @category = categories(:one)
  end

  test "should not save task without title" do
    task = Task.new
    assert_not task.save
  end

  test "should save task with valid attributes" do
    task = Task.new(
      title: "Example Task",
      content: "This is an example task content.",
      due_date: Date.today + 1,
      completed: false,
      user: @user,
      category: @category
    )
    assert task.save, "Could not save the task with valid attributes"
  end

  test "should not save task with past due date" do
    task = Task.new(
      title: "Past Due Task",
      due_date: Date.today - 1,
      user: @user,
      category: @category
    )
    assert_not task.save, "Saved the task with a past due date"
  end

end
