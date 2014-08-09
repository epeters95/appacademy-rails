require 'spec_helper'

BOB_USERNAME = "bitchtits@hotmail.com"
BOB_PASSWORD = "indeathhehasaname"
MARLA_USERNAME = 'marla.singer@gmail.com'
MARLA_PASSWORD = 'cancer'

def sign_in_as_marla
  visit new_user_url
  fill_in 'session_username', with: MARLA_USERNAME
  fill_in 'session_password', with: MARLA_PASSWORD
  click_on 'Sign In'
end

def create_marla
  create(:user, username: MARLA_USERNAME, password: MARLA_PASSWORD)
end

def sign_in_as_bob
  visit new_user_url
  fill_in 'session_username', with: BOB_USERNAME
  fill_in 'session_password', with: BOB_PASSWORD
  click_on 'Sign In'
end

def create_bob
  create(:user, username: BOB_USERNAME, password: BOB_PASSWORD)
end

def create_goal(user, name)
  create(:goal, user_id: user.id, name: name)
end

def init_users
  let!(:bob) { create_bob }
  let!(:marla) { create_marla }
end

feature "creating a goal" do
  
  init_users
  
  scenario "bob can create a new goal" do
    sign_in_as_bob
    expect(page).to have_content("New Goal")
    fill_in "Goal", with: "defeat angel face"
    click_on "New Goal"
    expect(page).to have_content("defeat angel face")
  end
  
  scenario "bob can view his own goals" do
    create_goal(bob, "defeat angel face")
    sign_in_as_bob
    expect(page).to have_content("defeat angel face")
  end
  
  scenario "marla can view bob's goals" do
    create_goal(bob, "defeat angel face")
    sign_in_as_marla
    visit user_url(bob)
    expect(page).to have_content("defeat angel face")
  end
  
  scenario "marla cannot create a goal for bob" do
    sign_in_as_marla
    visit user_url(bob)
    expect(page).to_not have_content("New Goal")
  end
  
end

feature "deleting a goal" do
  
  init_users
  
  scenario "bob can delete his own goals" do
    create_goal(bob, "defeat angel face")
    sign_in_as_bob
    expect(page.has_button?("Delete Goal")).to be true
  end
  
  scenario "marla cannot delete bob's goals" do
    create_goal(bob, "defeat angel face")
    sign_in_as_marla
    visit user_url(bob)
    expect(page.has_button?("Delete Goal")).to be false
  end
  
end

feature "completing a goal" do
  
  init_users
  
  scenario "bob can complete his own goals" do
    create_goal(bob, "defeat angel face")
    sign_in_as_bob
    expect(page.has_button?("Completed?")).to be true
    click_on "Completed?"
    expect(page.has_button?("Completed?")).to be false
  end
  
  scenario "marla cannot complete bob's goals" do
    create_goal(bob, "defeat angel face")
    sign_in_as_marla
    visit user_url(bob)
    expect(page.has_button?("Completed?")).to be false
  end
  
end