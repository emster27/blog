class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :email
      t.string :password
      t.string :account_type
      t.string :dob

      t.timestamps
    end
  end
end
