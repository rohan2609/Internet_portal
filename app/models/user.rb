class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         after_create :send_signup_email


         def send_signup_email
         	UserMailer.send_signup_email(self).deliver_now
         end

         def create_user_customer(customer_number,email)
         	customer_number.each do |customer_number|
         		UserCustomer.create(email: email, customer_number: customer_number)
         	end
         end
end
