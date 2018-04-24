require 'test_helper'

class ChangePasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get change_password_index_url
    assert_response :success
  end

  test "should get new" do
    get change_password_new_url
    assert_response :success
  end

  test "should get show" do
    get change_password_show_url
    assert_response :success
  end

  test "should get create" do
    get change_password_create_url
    assert_response :success
  end

  test "should get edit" do
    get change_password_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get change_password_destroy_url
    assert_response :success
  end

end
