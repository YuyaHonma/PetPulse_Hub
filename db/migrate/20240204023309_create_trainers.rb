class CreateTrainers < ActiveRecord::Migration[6.1]
  def change
    create_table :trainers do |t|
      t.references :category, foreign_key: true, null: true
      t.string :name
      t.string :name_kana
      t.string :telephone
      t.string :address
      t.date :birthday
      t.string :hobby
      t.string :license
      t.text :message
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
