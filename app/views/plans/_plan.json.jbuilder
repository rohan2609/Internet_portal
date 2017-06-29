json.extract! plan, :id, :plan_name, :plan_price, :plan_start_date, :plan_expiry_date, :created_at, :updated_at
json.url plan_url(plan, format: :json)
