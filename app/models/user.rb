class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true
  validates :username, presence: true, length: { minimum: 3, maximum: 12 }
end
