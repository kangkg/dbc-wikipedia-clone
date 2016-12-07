class Article < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :revisions

  after_initialize :set_default_values

  validates :status, :author_id, presence: true
  validates :status, inclusion: { in: %w(published unpublished) }

  def set_default_values
    self.status ||= "unpublished"
  end
end
