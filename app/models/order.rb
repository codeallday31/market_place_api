class Order < ApplicationRecord
  before_validation :set_total!

  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  private

  def set_total!
    self.total = self.products.map(&:price).sum
  end
end
