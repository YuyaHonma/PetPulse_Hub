class CreateOwnerFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :owner_favorites do |t|
      t.references :owner, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
