class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :plan_name
      t.string :plan_price

      t.string :no_of_days
      t.string :speed
      t.timestamps
    end
  end
end
