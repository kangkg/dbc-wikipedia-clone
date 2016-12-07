require 'rails_helper'

feature 'user can login and logout' do
  scenario 'user can login' do
    User.create(username: 'piepie123', password: 'piepie123', role: 'user')
    visit root_path

    click_on "Login!"
    find('#sessions_username').set('piepie123')
    find('#sessions_password').set('piepie123')
    click_on "Submit"
    expect(page).to have_content("Logout!")
  end

  scenario 'user can logout' do
    User.create(username: 'piepie123', password: 'piepie123', role: 'user')
    visit root_path

    click_on "Login!"
    find('#sessions_username').set('piepie123')
    find('#sessions_password').set('piepie123')
    click_on "Submit"
    click_on "Logout!"
    expect(page).to have_content("Login!")
  end
end

