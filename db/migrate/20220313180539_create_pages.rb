class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :hero_image
      t.text :page_name
      t.text :page_content
      t.string :comment

      t.timestamps
    end
  end
end
