class AddColumnToCustomers < ActiveRecord::Migration[5.0]
  def change
  	add_column :customers, :file_filename, :string
  	add_column :customers, :file_content_type, :string
  	add_column :customers, :file_file_size, :integer
  	add_column :customers, :file_updated_at, :datetime
  end
end
