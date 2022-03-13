class AddProfileReferenceToSocialLinks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :social_links, :profiles
    add_index :social_links, :profile_id
    change_column_null :social_links, :profile_id, false
  end
end
