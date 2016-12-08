class SortedArticle < ApplicationRecord
  belongs_to :article
  belongs_to :category
  validates :category_id, :article_id, presence: true
end
