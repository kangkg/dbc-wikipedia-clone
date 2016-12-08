require 'rails_helper'

feature 'user can make revisions' do
  let!(:user) { User.create!(username: "hello-man", password: "hello", role: 'user') }

  let!(:article) { Article.create!(author_id: user.id, status: "published", title: 'test_title') }

  scenario 'user can get to the new revision page' do
    visit root_path
    click_on "Login"
    find('#sessions_username').set(user.username)
    find('#sessions_password').set('hello')
    click_on "Submit"
    visit new_article_revision_path(article.id)
    expect(page).to have_content("MAKE A NEW REVISION!!!!")
  end
  xscenario 'make more revisions tests' do
    # need to make more tests for revisions
  end
end
