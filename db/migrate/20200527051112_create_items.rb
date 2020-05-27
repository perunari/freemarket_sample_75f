class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true
      t.string :condition, null: false
      t.string :postage_payment, null: false
      t.string :ship_from, null: false
      t.string :preparation, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
