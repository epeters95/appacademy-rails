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

feature "commenting on users" do
  
  init_users

  scenario "bob can comment on marla's profile" do
    sign_in_as_bob
    expect(page).to have_content("New Comment")
    fill_in "New Comment", with: "good luck with your brain cancer!"
    click_on "Post"
    expect(page).to have_content("good luck with your brain cancer!")
  end
  
end

feature "bob can comment on marla's goals" do
  
  init_users

  scenario "bob can comment on marla's profile" do
    goal = create_goal(marla, "trade blood parasites for brain parasites with jack")
    sign_in_as_bob
    visit goal_url(goal)
    expect(page).to have_content("New Comment")
    fill_in "New Comment", with: "wait, jack from juicers anon? no way!"
    click_on "Post"
    expect(page).to have_content("wait, jack from juicers anon? no way!")
  end
  
end

