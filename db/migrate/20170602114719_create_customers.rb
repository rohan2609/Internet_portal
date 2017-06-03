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
      t.timestamps
    end
  end
end
