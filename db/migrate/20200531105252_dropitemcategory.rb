class Dropitemcategory < ActiveRecord::Migration[5.2]
  def change
    drop_table :item_categories
  end
end
