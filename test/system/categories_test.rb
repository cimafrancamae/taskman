require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase

  setup do
    @user = users(:one)
    login_as(@user, scope: :user)
  end
  test "visiting the index" do
    visit categories_path

    assert_selector "h1", text: "Categories"
  end

  test "creating a new category" do
    visit new_category_path

    fill_in "Name", with: "New Category"
    click_on "Create Category"

    assert_text "Category saved successfully."
  end

  test "updating a category" do
    category = categories(:one)
    visit edit_category_path(category)

    fill_in "Name", with: "Updated Category"
    click_on "Update Category"

    assert_text "Category updated successfully."
  end

  test "destroying a category" do
    category = categories(:one)
    visit category_path(category)

    accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Category deleted successfully."
  end
end
