class AddPageReferenceToAnalytics < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :analytics, :pages
    add_index :analytics, :page_id
    change_column_null :analytics, :page_id, false
  end
end
