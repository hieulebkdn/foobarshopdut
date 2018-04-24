require 'test_helper'

class SigninControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get signin_index_url
    assert_response :success
  end

  test "should get new" do
    get signin_new_url
    assert_response :success
  end

  test "should get create" do
    get signin_create_url
    assert_response :success
  end

  test "should get show" do
    get signin_show_url
    assert_response :success
  end

  test "should get destroy" do
    get signin_destroy_url
    assert_response :success
  end

end
