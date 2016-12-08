class Revision < ApplicationRecord
  validates :editor_id, :article_id, :body, presence: true
  validates :previous_revision_id, :allow_blank => true, uniqueness: true
  belongs_to :article
  belongs_to :editor, class_name: "User"
  belongs_to :previous_revision, class_name: "Revision", optional: true
end
