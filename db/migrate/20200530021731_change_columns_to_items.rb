class ChangeColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :condition, :condition_id
    rename_column :items, :postage_payment, :postage_payment_id
    rename_column :items, :ship_from, :ship_from_id
    rename_column :items, :preparation, :preparation_id
    change_column :items, :condition_id, :integer
    change_column :items, :postage_payment_id, :integer
    change_column :items, :ship_from_id, :integer
    change_column :items, :preparation_id, :integer
  end
end
