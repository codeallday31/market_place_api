class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /@/ }
  validates :password_digest, presence: true
  has_secure_password

  has_many :products, dependent: :destroy
end
