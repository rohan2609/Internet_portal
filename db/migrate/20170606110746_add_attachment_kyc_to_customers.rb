class AddAttachmentKycToCustomers < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.attachment :kyc
    end
  end

  def self.down
    remove_attachment :customers, :kyc
  end
end
