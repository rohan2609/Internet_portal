require 'test_helper'

class OfflinePaymentHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offline_payment_history = offline_payment_histories(:one)
  end

  test "should get index" do
    get offline_payment_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_offline_payment_history_url
    assert_response :success
  end

  test "should create offline_payment_history" do
    assert_difference('OfflinePaymentHistory.count') do
      post offline_payment_histories_url, params: { offline_payment_history: { amount_paid: @offline_payment_history.amount_paid, bank_name: @offline_payment_history.bank_name, cash: @offline_payment_history.cash, check: @offline_payment_history.check, check_number: @offline_payment_history.check_number, customer_id: @offline_payment_history.customer_id, plan_id: @offline_payment_history.plan_id } }
    end

    assert_redirected_to offline_payment_history_url(OfflinePaymentHistory.last)
  end

  test "should show offline_payment_history" do
    get offline_payment_history_url(@offline_payment_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_offline_payment_history_url(@offline_payment_history)
    assert_response :success
  end

  test "should update offline_payment_history" do
    patch offline_payment_history_url(@offline_payment_history), params: { offline_payment_history: { amount_paid: @offline_payment_history.amount_paid, bank_name: @offline_payment_history.bank_name, cash: @offline_payment_history.cash, check: @offline_payment_history.check, check_number: @offline_payment_history.check_number, customer_id: @offline_payment_history.customer_id, plan_id: @offline_payment_history.plan_id } }
    assert_redirected_to offline_payment_history_url(@offline_payment_history)
  end

  test "should destroy offline_payment_history" do
    assert_difference('OfflinePaymentHistory.count', -1) do
      delete offline_payment_history_url(@offline_payment_history)
    end

    assert_redirected_to offline_payment_histories_url
  end
end
