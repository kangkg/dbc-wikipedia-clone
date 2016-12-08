class User < ApplicationRecord
  has_many :revisions
  has_many :articles

  validates :username, :password_digest, presence: true, uniqueness: true
  validates :role, presence: true

  has_secure_password
end
