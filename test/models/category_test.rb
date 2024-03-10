require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  setup do
    @user = users(:one)
  end

  test "should not save category without name" do
    category = Category.new
    assert_not category.save, "Saved the category without a name."
  end

  test "should save category with valid attributes" do
    category = Category.new(
      name: "Example Category",
      user: @user)
    assert category.save, "Could not save category with valid attributes. Errors: #{category.errors.full_messages.join(', ')}"
  end

end
