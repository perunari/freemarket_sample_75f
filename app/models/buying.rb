class Buying < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :address, optional: true
  belongs_to :credit_card, optional: true
  belongs_to :item, optional: true

  validates :user_id, :item_id, :address_id, :credit_card_id, :amount, presence: true
end
