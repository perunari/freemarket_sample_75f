class Buying < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :credit_card
  belongs_to :item
end
