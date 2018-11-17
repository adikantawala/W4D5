require 'rails_helper'

feature "Sign Up" do 
  
  background :each do 
    visit new_user_path #difference between this and new_user_url?
  end
  
  scenario "has user sign-up page" do
    expect(page).to have_content("Create User")
  end
  
  scenario "takes a username and password" do
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
  end
  
  scenario "redirect to user show page" do
    fill_in "Username", with: "harry_potter"
    fill_in "Password", with: "password"
    click_button "Create User"
    
    expect(page).to have_content("Welcome harry_potter!")
    user = User.find_by(username: "harry_potter")
    expect(current_url).to eq(user_url(user))
  end
  
end