json.extract! customer, :id, :fullname, :dob, :mobile_no, :phone_no, :email, :kyc, :date, :payment_mode, :status, :address1, :address2, :customer_number, :pincode, :created_at, :updated_at
json.url customer_url(customer, format: :json)
