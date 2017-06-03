class Customer < ApplicationRecord
  belongs_to :plan
   validates :mobile_no, numericality: { only_integer: true }, length: \
  { minimum: 6, maximum: 11 }, allow_blank: true
   validates :phone_no, numericality: { only_integer: true }, length: \
  { minimum: 6, maximum: 11 }, allow_blank: true
 
   validates :email, presence: true, format: \
  { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }
    validates :address1, length: { in: 1..50 }, allow_blank: true
    validates :address2, length: { in: 1..50 }, allow_blank: true
after_save :create_user_account


private

 def create_user_account
    user = User.new do |u|
      u.email = email
      u.password = customer_number
      u.save
    end

  end

end

  