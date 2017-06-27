class AddImageToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :image, :string
  end
end
