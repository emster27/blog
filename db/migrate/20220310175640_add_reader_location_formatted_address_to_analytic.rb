class AddReaderLocationFormattedAddressToAnalytic < ActiveRecord::Migration[6.0]
  def change
    add_column :analytics, :reader_location_formatted_address, :string
  end
end
