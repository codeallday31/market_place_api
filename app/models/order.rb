class Order < ApplicationRecord
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements
end
