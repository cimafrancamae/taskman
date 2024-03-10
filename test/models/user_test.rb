require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save user without email" do
    user = User.new
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user without password" do
    user = User.new(email: "example.example.com")
    assert_not user.save, "Saved the user without a password"
  end

  test "should save user with valid attributes" do
    user = User.new(email: "example@example.com", password: "password")
    assert user.save, "Could not save the user with valid attributes"
  end
end
