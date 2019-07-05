require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do 
    visit new_user_url
    expect(page).to have_content("Username")

  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in('username', with: 'amelia')
      fill_in('password', with: 'starwars')
      click_on 'Create User'
    end

    scenario 'redirects to all the users after signup' do
      expect(page).to have_content('all the users')
    end

    scenario 'shows username on the homepage after signup' do 
      expect(page).to have_content('amelia')
    end
    
  end
end

feature 'logging in' do
    before(:each) do
      visit new_session_url
      fill_in('username', with: 'amelia')
      fill_in('password', with: 'starwars')
      click_on 'Login'
    end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content('amelia')
  end

end

feature 'logging out' do
    before(:each) do
      visit new_session_url
      fill_in('username', with: 'amelia')
      fill_in('password', with: 'starwars')
      click_on 'Login'
      visit users_url
      click_on 'logout'
    end
  scenario 'begins with a logged out state' do 
    expect(page).to have_content('Login')
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    expect(page).to_not have_content('amelia')
  end

end