class CreditCard < ApplicationRecord
  belongs_to :user
  has_many :buyings

  validates :user_id, :customer_id, :card_id, presence: true
end
