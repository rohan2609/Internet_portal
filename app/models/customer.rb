class Customer < ApplicationRecord
  belongs_to :plan
  has_many :payments
   validates :mobile_no, numericality: { only_integer: true }, length: \
  { minimum: 6, maximum: 11 }, allow_blank: true
   validates :phone_no, numericality: { only_integer: true }, length: \
  { minimum: 6, maximum: 11 }, allow_blank: true
   validates :address1, length: { in: 1..50 }, allow_blank: true
    validates :address2, length: { in: 1..50 }, allow_blank: true
  attr_accessor :file,:customer_id
  mount_uploader :file   
  has_many :customer_attachments, dependent: :destroy
  accepts_nested_attributes_for :customer_attachments
  after_save :create_user_account
  before_create :set_access_token


private

 def set_access_token
    self.access_token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless Customer.where(access_token: token).exists?
      Customer.update(access_token: token)
    end
  end

 def create_user_account
    user = User.new do |u|
      u.email = email
      u.password = customer_number
      u.save
    end

  end

end

