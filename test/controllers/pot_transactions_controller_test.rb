require "test_helper"

class PotTransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pot_transactions_index_url
    assert_response :success
  end

  test "should get new" do
    get pot_transactions_new_url
    assert_response :success
  end

  test "should get create" do
    get pot_transactions_create_url
    assert_response :success
  end
end
