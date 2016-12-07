require 'rails_helper'

describe Article do
  let(:article) { Article.new }

  describe "validations" do
    it 'has to have a author_id, status, and title' do
      expect(article.invalid?).to be_truthy
      article.author_id = 1
      article.status = 'unpublished'
      article.title = 'Article Title'
      expect(article.invalid?).to be_falsey
    end
  end

end
