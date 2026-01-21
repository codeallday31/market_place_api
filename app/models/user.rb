class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: /@/ }
  validates :password_digest, presence: true

  has_secure_password
end
