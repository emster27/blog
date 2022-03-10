class AddPageReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :pages
    add_index :bookmarks, :page_id
    change_column_null :bookmarks, :page_id, false
  end
end
