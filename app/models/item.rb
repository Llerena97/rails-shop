class Item < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :user, optional: true
  has_many :line_items
  mount_uploader :image, ImageUploader
  validates :brand, :model, :title, :price, presence: true
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed."}
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed."}
  validates :price, numericality: { only_integer: true }, length: { maximum: 8 }

  BRAND = %w{ Nike Adidas Reebook Fila Other }
  FINISH = %w{ Black White Blue Red Yellow Other }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
    
  end
end
