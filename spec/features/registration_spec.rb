require 'rails_helper'

describe 'User Features' do
  feature 'user registration' do
    scenario 'user can create an account' do
        visit new_user_path

        find('#user_username').set('ilovepie')
        find('#user_password').set('password')
        click_on "Submit"
        expect(page).to have_content("Logout")
    end
  end
end
