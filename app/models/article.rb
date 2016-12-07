class Article < ApplicationRecord
  validates :status, :author_id, presence: true
  validates :status, inclusion: { in: %w(published unpublished) }
end
