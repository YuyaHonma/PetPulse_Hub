class CreateTrainerFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :trainer_favorites do |t|
      t.references :trainer, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
