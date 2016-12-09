require 'rails_helper'

feature 'articles' do
  scenario 'displays a list of articles' do
    user = User.create!(username: 'piepie123', password: 'piepie123', role: 'user')
    article = Article.create!(author_id: user.id, title: "Jay Chou", status: "published", featured: false)
    revisions = Revision.create!(editor_id: user.id, article_id: article.id, body: "Jay Chou (born 18 January 1979) is a Taiwanese musician, singer, songwriter, record producer, actor, and director.")
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

