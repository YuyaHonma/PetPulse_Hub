class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :owner, foreign_key: true, null: false
      t.references :trainer, foreign_key: true, null: false

      t.timestamps
    end
  end
end
