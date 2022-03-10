class AddReaderReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :readers
    add_index :comments, :reader_id
    change_column_null :comments, :reader_id, false
  end
end
