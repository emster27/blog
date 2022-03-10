class CreateAnalytics < ActiveRecord::Migration[6.0]
  def change
    create_table :analytics do |t|
      t.integer :page_id
      t.string :reader_location
      t.integer :view_count
      t.integer :reader_id

      t.timestamps
    end
  end
end
