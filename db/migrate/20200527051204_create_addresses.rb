class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, type: :bigint, foreign_key: true
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.integer :postal_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.integer :phone
      t.timestamps
    end
  end
end
