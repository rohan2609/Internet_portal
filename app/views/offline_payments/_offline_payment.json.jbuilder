json.extract! offline_payment, :id, :cash, :check, :customer_id, :plan_id, :created_at, :updated_at
json.url offline_payment_url(offline_payment, format: :json)
