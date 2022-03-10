class AddProfileReferenceToPages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :pages, :profiles, column: :writer_id
    add_index :pages, :writer_id
    change_column_null :pages, :writer_id, false
  end
end
