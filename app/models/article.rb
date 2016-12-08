class Article < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :revisions
  has_many :sorted_articles
  has_many :categories, through: :sorted_articles
  has_many :links

  after_initialize :set_default_values

  validates :title, :status, :author_id, presence: true
  validates :status, inclusion: { in: %w(published unpublished) }

  def set_default_values
    self.status ||= "unpublished"
  end

  def self.search(search)
    if search
      where("title ILIKE ?", "%#{search}%")
    else
      all
    end
  end
end
