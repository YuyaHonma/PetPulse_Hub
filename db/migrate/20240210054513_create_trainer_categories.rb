class CreateTrainerCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :trainer_categories do |t|
      t.references :trainer, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
