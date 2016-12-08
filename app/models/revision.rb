class Revision < ApplicationRecord
  validates :editor_id, :article_id, :body, presence: true
  validates :previous_revision_id, :allow_blank => true, uniqueness: true
  belongs_to :article
  belongs_to :editor, class_name: "User"
  belongs_to :previous_revision, class_name: "Revision", optional: true

  before_save :add_links

  def add_links
    links = Link.all
    self.body.split(' ').each do |word|
      links.each do |link|
        if link.word == word
          self.body.gsub!(/#{word}/, "<%= link_to article.title, article_path(#{link.article_id}) %>")
        end
      end
    end
  end
end
