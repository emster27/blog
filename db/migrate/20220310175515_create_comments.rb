class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :page_id
      t.integer :reader_id
      t.string :reader_name
      t.string :reader_email

      t.timestamps
    end
  end
end
