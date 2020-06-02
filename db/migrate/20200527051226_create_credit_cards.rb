class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards, id: :integer do |t|
      t.references :user, type: :integer, foreign_key: true
      t.integer :card_number, null: false, unique: true
      t.integer :exp_month, null: false
      t.integer :exp_year, null: false
      t.timestamps
    end
  end
end
