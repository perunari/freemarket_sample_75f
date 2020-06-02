class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :integer do |t|
      t.references :user, type: :integer, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.references :category, type: :integer, foreign_key: true
      t.references :brand, type: :integer, foreign_key: true
      t.integer :condition_id, null: false
      t.integer :postage_payment_id, null: false
      t.integer :ship_from_id, null: false
      t.integer :preparation_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
