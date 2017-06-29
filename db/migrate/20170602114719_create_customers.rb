class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :fullname
      t.string :mobile_no
      t.string :phone_no
      t.string :email
      t.string :access_token
      t.string :file
      t.string :file_file_name
      t.datetime :date
      t.boolean :status
      t.string :address1
      t.string :address2
      t.string :customer_number
      t.string :pincode
      t.references :plan
      t.references :payment
      t.date :plan_start_date
      t.date :plan_expiry_date
      t.timestamps
    end
  end
end
