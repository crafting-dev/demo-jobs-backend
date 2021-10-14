require "test_helper"

class EmployersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get employers_show_url
    assert_response :success
  end

  test "should get new" do
    get employers_new_url
    assert_response :success
  end

  test "should get create" do
    get employers_create_url
    assert_response :success
  end

  test "should get edit" do
    get employers_edit_url
    assert_response :success
  end

  test "should get update" do
    get employers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get employers_destroy_url
    assert_response :success
  end
end
