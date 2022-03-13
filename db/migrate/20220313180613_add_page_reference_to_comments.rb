class AddPageReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :pages
    add_index :comments, :page_id
    change_column_null :comments, :page_id, false
  end
end
