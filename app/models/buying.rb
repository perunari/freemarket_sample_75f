class Buying < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :credit_card
  belongs_to :item

  validates :user_id, :item_id, :address_id, :credit_card_id, :amount, presence: true
end
