require 'spec_helper'

MARLA_USERNAME = 'marla.singer@gmail.com'
MARLA_PASSWORD = 'cancer'

def register_marla
  visit new_user_url
  fill_in 'user_username', with: MARLA_USERNAME
  fill_in 'user_password', with: MARLA_PASSWORD
  click_on 'Create User'
end

def sign_in_as_marla
  visit new_user_url
  fill_in 'session_username', with: MARLA_USERNAME
  fill_in 'session_password', with: MARLA_PASSWORD
  click_on 'Sign In'
end

def create_marla
  create(:user, username: MARLA_USERNAME, password: MARLA_PASSWORD)
end

feature "the signup process" do 

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    
    before(:each) do
      register_marla
    end
  
    scenario "shows username on the homepage after signup" do
      expect(page).to have_content MARLA_USERNAME
    end

  end

end

feature "logging in" do

  before(:each) do
    create_marla
    sign_in_as_marla
  end    
  
  scenario "shows username on the homepage after login" do
    expect(page).to have_content 'marla.singer@gmail.com'
  end
  
end

feature "logging out" do

  scenario "begins with logged out state" do
    visit new_user_url
    expect(page).to have_content 'Sign In'
  end

  scenario "doesn't show username on the homepage after logout" do
    create_marla
    sign_in_as_marla
    click_on 'Sign Out'
    expect(page).to_not have_content MARLA_USERNAME
  end

end

feature "editing user" do
  
  let!(:user) { create_marla }
  
  before(:each) do
    sign_in_as_marla
  end
  
  scenario "edit user page exists" do
    
    expect(page).to have_content "Edit User"
  end
  
  scenario "can change password" do
    visit edit_user_url(user)
    fill_in 'user_password', with: 'brain parasites'
    click_on 'Update User'
    expect(User.find(user.id).password).to eq('brain parasites')
  end

end
