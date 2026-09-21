require "test_helper"

class RecurringBillsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recurring_bills_index_url
    assert_response :success
  end

  test "should get new" do
    get recurring_bills_new_url
    assert_response :success
  end

  test "should get create" do
    get recurring_bills_create_url
    assert_response :success
  end

  test "should get edit" do
    get recurring_bills_edit_url
    assert_response :success
  end

  test "should get update" do
    get recurring_bills_update_url
    assert_response :success
  end

  test "should get destroy" do
    get recurring_bills_destroy_url
    assert_response :success
  end
end
