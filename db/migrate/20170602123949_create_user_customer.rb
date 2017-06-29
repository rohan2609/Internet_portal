class CreateUserCustomer < ActiveRecord::Migration[5.0]
  def change
    create_table :user_customers do |t|
      t.references :user, foreign_key: true
      t.references :customer, foreign_key: true
    end
  end
end
