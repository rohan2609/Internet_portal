json.extract! payment, :id, :mihpayid, :txnid, :status, :unmappedstatus, :amount, :cardCategory, :email, :name_on_card, :issuing_bank, :customer_id, :plan_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
