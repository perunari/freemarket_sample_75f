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
  belongs_to_active_hash :status

  validates :images, length: { in: 1..10, message: 'を1枚~10枚アップロードしてください' }
  validates :user_id, :name, :description, :price, :status_id, presence: true
  validates :category_id, :condition_id, :postage_payment_id, :ship_from_id, :preparation_id, length: { minimum: 1, message: 'を選択してください' }
  validates :name, length: { maximum: 40, message: 'は最大で40字までです' }
  validates :description, length: { maximum: 1000, message: 'は最大で1000字までです' }
  validates :price, numericality: { greater_than_or_equal_to: 300, message: 'は¥300〜9,999,999の範囲で入力してください' }
  validates :price, numericality: { less_than: 10000000, message: 'は¥300〜9,999,999の範囲で入力してください' }
  attribute :status_id, :integer, default: 1

end
