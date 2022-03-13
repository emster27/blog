class CreateSocialLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :social_links do |t|
      t.string :username
      t.string :medium
      t.string :password
      t.integer :profile_id

      t.timestamps
    end
  end
end
