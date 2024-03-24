class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :introduction
      t.string :image
      t.string :adress
      ##緯度、経度後で追加

      t.timestamps
    end
  end
end
