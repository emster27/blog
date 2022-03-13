class AddReaderReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :readers
    add_index :bookmarks, :reader_id
    change_column_null :bookmarks, :reader_id, false
  end
end
