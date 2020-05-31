class CreateItemCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_categories do |t|
      t.references :item, type: :bigint, foreign_key: true
      t.references :category, type: :bigint, foreign_key: true
      t.timestamps
    end
  end
end
