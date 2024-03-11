require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

  test "creating a new user" do
    visit new_user_registration_path

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Sign up"

    assert_selector "div", text: "Welcome! You have signed up successfully."
  end

  test "logging in as an existing user" do
    user = users(:one)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"

    click_on "Log in"

    assert_selector "div", text: "Signed in successfully."
  end

end
