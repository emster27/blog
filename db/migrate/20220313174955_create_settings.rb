class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.text :owner_info
      t.string :billing
      t.integer :billing_card
      t.text :domains
      t.integer :profile_id

      t.timestamps
    end
  end
end
