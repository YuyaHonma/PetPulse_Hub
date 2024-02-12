class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :name_kana
      t.string :telephone
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
