class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true

  belongs_to :user

  scope :filter_by_title, ->(title) { where("lower(title) LIKE ?", "%#{title.downcase}%") }
  scope :above_or_equal_to_price, ->(price) { where("price >= ?", price) }
  scope :below_or_equal_to_price, ->(price) { where("price <= ?", price) }
  scope :recent, -> { order(:updated_at) }
end
