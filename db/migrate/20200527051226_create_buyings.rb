class CreateBuyings < ActiveRecord::Migration[5.2]
  def change
    create_table :buyings do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.references :address, foreign_key: true
      t.references :credit_card, foreign_key: true
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
