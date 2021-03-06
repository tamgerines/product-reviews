class Product < ActiveRecord::Base
  validates :brand, :name, :description, :image_url, :category, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: {scope: :brand}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
