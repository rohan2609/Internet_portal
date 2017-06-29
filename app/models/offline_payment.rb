class OfflinePayment < ApplicationRecord
  belongs_to :customer
  belongs_to :plan
  has_many :offline_payment_histories
end
