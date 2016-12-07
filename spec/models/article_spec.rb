require 'rails_helper'

describe Article do
  let(:article) { Article.new }

  describe "validations" do
    it 'has to have a author_id, status, and title' do
      user = User.create(username: 'a', password: 'b', role: 'user')
      expect(article.invalid?).to be_truthy
      article.author_id = user.id
      article.status = 'unpublished'
      article.title = 'Article Title'
      expect(article.invalid?).to be_falsey
    end
  end

end
