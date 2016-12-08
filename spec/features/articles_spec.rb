require 'rails_helper'

feature 'articles' do
  scenario 'displays a list of articles' do
    user = User.create!(username: 'piepie123', password: 'piepie123', role: 'user')
    article = Article.create!(author_id: user.id, title: "Jay Chou", status: "published")
    visit articles_path

    within('#articles') do
      expect(page).to have_content article.title
      click_link("Jay Chou")
    end

    expect(page).to have_current_path article_path(article)
  end

  xscenario 'user can create a new article if they are logged in' do

  end

  xscenario 'user can view an article' do

  end

  xscenario 'user can delete an article if they are admin' do

  end
end

