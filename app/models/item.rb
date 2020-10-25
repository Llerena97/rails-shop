class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true
  validates :brand, :model, :title, :price, presence: true
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed."}
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed."}
  validates :price, numericality: { only_integer: true }, length: { maximum: 8 }

  BRAND = %w{ Nike Adidas Reebook Fila Other }
  FINISH = %w{ Black White Blue Red Yellow Other }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }
end
