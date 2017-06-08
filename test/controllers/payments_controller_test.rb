require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get payments_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_url
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post payments_url, params: { payment: { amount: @payment.amount, cardCategory: @payment.cardCategory, customer_id: @payment.customer_id, email: @payment.email, issuing_bank: @payment.issuing_bank, mihpayid: @payment.mihpayid, name_on_card: @payment.name_on_card, plan_id: @payment.plan_id, status: @payment.status, txnid: @payment.txnid, unmappedstatus: @payment.unmappedstatus } }
    end

    assert_redirected_to payment_url(Payment.last)
  end

  test "should show payment" do
    get payment_url(@payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_url(@payment)
    assert_response :success
  end

  test "should update payment" do
    patch payment_url(@payment), params: { payment: { amount: @payment.amount, cardCategory: @payment.cardCategory, customer_id: @payment.customer_id, email: @payment.email, issuing_bank: @payment.issuing_bank, mihpayid: @payment.mihpayid, name_on_card: @payment.name_on_card, plan_id: @payment.plan_id, status: @payment.status, txnid: @payment.txnid, unmappedstatus: @payment.unmappedstatus } }
    assert_redirected_to payment_url(@payment)
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete payment_url(@payment)
    end

    assert_redirected_to payments_url
  end
end
