class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :owner, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false
      t.string :title
      t.text :introduction
      t.text :current_approach

      t.timestamps
    end
  end
end
