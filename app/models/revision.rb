class Revision < ApplicationRecord
  belongs_to :article
  belongs_to :editor, class_name: "User"
  belongs_to :previous_revision, class_name: "Revision"
end
