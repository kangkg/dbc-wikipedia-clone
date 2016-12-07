require 'rails_helper'

describe Revision do
  let(:revision) { Revision.new }

  describe "validations" do
    it 'has to have a editor_id, article_id, and body' do
      expect(revision.invalid?).to be_truthy
      user = User.create(username: 'a', password: 'b', role: 'user')
      article = Article.create(author_id: user.id, status: 'published', title:'c')
      revision.editor_id = user.id
      revision.article_id = article.id
      revision.body = 'hello'
      expect(revision.valid?).to be_truthy
    end
  end

  describe "associations" do
    it 'revision belongs to an article' do
      expect(revision.article).to be(nil)
    end
    it 'revision belongs to an editor' do
      expect(revision.editor).to be(nil)
    end
    it 'revision can belong to a revision' do
      expect(revision.previous_revision).to be(nil)
    end
  end
end
