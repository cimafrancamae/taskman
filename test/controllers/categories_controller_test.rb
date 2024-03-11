require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: 'New Category' } }
    end

    @category = Category.last
    assert_not_nil @category

    assert_redirected_to category_path(@category)
    assert_equal 'Category saved successfully.', flash[:notice]
  end
end
