class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :reader_name
      t.string :reader_email
      t.text :comment
      t.integer :page_id

      t.timestamps
    end
  end
end
