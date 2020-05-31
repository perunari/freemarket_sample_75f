class Item < ApplicationRecord

  belongs_to :user
  has_one :buying, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  belongs_to :brand, optional: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payment
  belongs_to_active_hash :preparation

  validates :images, length: { minimum: 1 }
  validates :user_id, :name, :description, :category_id, :condition_id, :postage_payment_id, :ship_from_id, :preparation_id, :price, presence: true
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
    
end
