class OfflinePaymentHistory < ApplicationRecord
  belongs_to :customer
  belongs_to :plan
  belongs_to :offline_payment
end
