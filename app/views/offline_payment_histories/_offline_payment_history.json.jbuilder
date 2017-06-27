json.extract! offline_payment_history, :id, :customer_id, :plan_id, :cash, :check, :bank_name, :check_number, :amount_paid, :created_at, :updated_at
json.url offline_payment_history_url(offline_payment_history, format: :json)
