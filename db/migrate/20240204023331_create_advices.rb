class CreateAdvices < ActiveRecord::Migration[6.1]
  def change
    create_table :advices do |t|
      t.references :post, foreign_key: true, null: false
      t.references :trainer, foreign_key: true, null: false
      t.text :advice

      t.timestamps
    end
  end
end
