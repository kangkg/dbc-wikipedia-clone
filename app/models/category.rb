class Category < ApplicationRecord
  validates :name, presence: true

  has_many :sorted_articles
  has_many :articles, through: :sorted_articles
end
