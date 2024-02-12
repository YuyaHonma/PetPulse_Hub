class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.references :owner, foreign_key: true, null: false
      t.string :pet_name
      t.string :pet_name_kana
      t.integer :gender, default: 0
      t.integer :dog_breed, default: 0
      t.date :dog_birthday

      t.timestamps
    end
  end
end
