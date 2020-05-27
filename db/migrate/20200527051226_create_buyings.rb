class CreateBuyings < ActiveRecord::Migration[5.2]
  def change
    create_table :buyings do |t|
      t.references :user, type: :bigint, foreign_key: true
      t.references :item, type: :bigint, foreign_key: true
      t.references :address, type: :bigint, foreign_key: true
      t.references :credit_card, type: :bigint, foreign_key: true
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
