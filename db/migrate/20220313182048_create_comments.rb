class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :page_name
      t.text :reader
      t.integer :page_id

      t.timestamps
    end
  end
end
