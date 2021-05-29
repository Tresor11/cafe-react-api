class Item < ApplicationRecord
  validates_presence_of :name, :price, :category, :image
  mount_uploader :image, ImageUploader
end
