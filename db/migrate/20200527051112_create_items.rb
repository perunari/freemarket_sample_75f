class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, type: :bigint, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.references :category, type: :bigint, foreign_key: true
      t.references :brand, type: :bigint, foreign_key: true
      t.string :condition, null: false
      t.string :postage_payment, null: false
      t.string :ship_from, null: false
      t.string :preparation, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
