class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :owner, foreign_key: true, null: false
      t.references :trainer, foreign_key: true, null: false
      t.references :room, foreign_key: true, null: false
      t.text :message
      t.boolean :send_type, default: false
      t.boolean :read, default: false
      t.datetime :read_at, default: false

      t.timestamps
    end
  end
end
