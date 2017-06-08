class Home < ApplicationRecord

	 attr_accessor :name, :email, :contact_no,:message

  validates :name,
    presence: true

  validates :email,
    presence: true

  validates :contact_no,
    presence: true

end
