class CreateCustomerAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_attachments do |t|
      t.references :customer, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
