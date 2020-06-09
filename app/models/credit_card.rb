class CreditCard < ApplicationRecord
  belongs_to :user, optional: true
  has_many :buyings, dependent: :destroy

  validates :user_id, :customer_id, :card_id, presence: true
end
