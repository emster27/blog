class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :hero_image
      t.integer :writer_id
      t.string :page_name

      t.timestamps
    end
  end
end
