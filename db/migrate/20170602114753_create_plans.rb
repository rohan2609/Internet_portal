class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :plan_name
      t.string :plan_price
      t.date :plan_start_date
      t.date :plan_expiry_date
      t.string :speed
      t.timestamps
    end
  end
end
