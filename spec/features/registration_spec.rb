require 'rails_helper'

feature 'user registration' do
  scenario 'user can create an account' do
      visit new_user_path

      find('#user_username').set('ilovepie')
      find('#user_password').set('password')

      expect {click_on "Submit"}.to change(User, :count).by(1)
      expect(page).to have_content("Logout!")
  end
end
