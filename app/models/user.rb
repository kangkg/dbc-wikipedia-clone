class User < ApplicationRecord
  validates :username, :password_digest, presence: true, uniqueness: true
  validates :role, presence: true

  has_secure_password
end
