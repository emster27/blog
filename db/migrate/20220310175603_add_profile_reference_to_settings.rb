class AddProfileReferenceToSettings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :settings, :profiles
    add_index :settings, :profile_id
    change_column_null :settings, :profile_id, false
  end
end
