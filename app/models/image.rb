class Image < ApplicationRecord
  
  belongs_to :item

  mount_uploader :picture, ImageUploader

  validates :picture, presence: true

end
