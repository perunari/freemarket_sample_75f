class Item < ApplicationRecord
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status

  attribute :status_id, :integer, default: 1
  varidates :status_id, presence: true
end
