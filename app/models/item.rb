class Item < ApplicationRecord

  belongs_to :user
  has_one :buying, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  belongs_to :brand

  validates :user_id, :name, :description, :category_id, :condition, :postage_payment, :ship_from, :preparation, :price, presence: true
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  # validates :images, length: { minimum: 1 }
    
end
