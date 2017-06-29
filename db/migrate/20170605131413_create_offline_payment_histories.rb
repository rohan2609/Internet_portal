class CreateOfflinePaymentHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :offline_payment_histories do |t|
      t.references :customer, foreign_key: true
      t.references :plan, foreign_key: true
      t.references :offline_payment, foreign_key: true
      t.string :cash
      t.string :check
      t.string :bank_name
      t.string :check_number
      t.string :amount_paid

      t.timestamps
    end
  end
end
