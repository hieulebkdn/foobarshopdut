require 'test_helper'

class OrdersHistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orders_history_index_url
    assert_response :success
  end

  test "should get new" do
    get orders_history_new_url
    assert_response :success
  end

  test "should get show" do
    get orders_history_show_url
    assert_response :success
  end

  test "should get create" do
    get orders_history_create_url
    assert_response :success
  end

  test "should get edit" do
    get orders_history_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get orders_history_destroy_url
    assert_response :success
  end

end
