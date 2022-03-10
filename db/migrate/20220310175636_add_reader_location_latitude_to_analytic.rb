class AddReaderLocationLatitudeToAnalytic < ActiveRecord::Migration[6.0]
  def change
    add_column :analytics, :reader_location_latitude, :float
  end
end
