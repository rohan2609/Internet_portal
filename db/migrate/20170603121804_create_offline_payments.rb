class CreateOfflinePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :offline_payments do |t|
      t.string :cash
      t.string :check
      t.references :customer, foreign_key: true
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
