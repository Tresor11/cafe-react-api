class Item < ApplicationRecord
  validates_presence_of :name, :price, :type, :image
  mount_uploader :image, ImageUploader
end
