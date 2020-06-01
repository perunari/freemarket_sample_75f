class CreateBuyings < ActiveRecord::Migration[5.2]
  def change
    create_table :buyings do |t|
      t.references :user, type: :integer, foreign_key: true
      t.references :item, type: :integer, foreign_key: true
      t.references :address, type: :integer, foreign_key: true
      t.references :credit_card, type: :integer, foreign_key: true
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
