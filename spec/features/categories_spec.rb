require 'rails_helper'

describe 'Categories Features' do
  let!(:author) { User.create!(username: "Mike", password: "mike", role: "admin") }
  let!(:article) { Article.create!(author_id: author.id, title: "Empanada",status: "published")}
  let!(:category) { Category.create!(name: "I'm a Category")} # note: let! actually makes the variable category- otherwise it simply runs the block.
  # let(:article) { Category.create!(name: "I'm a Category")}
  let!(:sorted_article) { SortedArticle.create(article_id: article.id, category_id: category.id) }

  feature 'user can browser categories' do

    xscenario 'click' do
      visit categories_path
      click_on category.name
      expect(page).to have_content category.name
      expect(page).to have_content category.articles[0].title
    end

  end

end

# Note that let is lazy-evaluated: it is not evaluated until the first time the method it defines is invoked. You can use let! to force the method's invocation before each example.
