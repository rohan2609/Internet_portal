class Payment < ApplicationRecord
  belongs_to :customer
  belongs_to :plan
after_save :create_payment_token

private
   def create_payment_token
    payment = Customer.new do |u|
      u.access_token = txnid
      u.save
    end

  end
end
