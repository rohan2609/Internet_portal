class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :fullname
      t.string :mobile_no
      t.string :phone_no
      t.string :email
      t.string :kyc
      t.datetime :date
      t.string :payment_mode
      t.boolean :status
      t.string :address1
      t.string :address2
      t.string :customer_number
      t.string :pincode
      t.references :plan
       t.float :amount
       t.float :paid_amount
      t.datetime :paid_at
      t.string :status
      t.string :card_name
      t.string :ip_address
      t.timestamps
    end
  end
end
