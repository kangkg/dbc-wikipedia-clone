class Article < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :revisions
  has_many :sorted_articles
  has_many :categories, through: :sorted_articles
  has_many :links

  after_initialize :set_default_values

  #can't add validation for featured due to test

  validates :title, :status, :author_id, presence: true
  validates :status, inclusion: { in: %w(published unpublished) }

  accepts_nested_attributes_for :sorted_articles, :revisions

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

  def last_revision
    # self.revisions.last.body
    # can't add this due to other code
  end
end
