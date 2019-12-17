require 'rails_helper'

RSpec.feature "User logs in", type: :feature, js: true do
  before :each do
   @user = User.create!(
      first_name: 'Russell',
      last_name: 'Cape',
      email: 'russell@test.com',
      password: 'ABCD',
      password_confirmation: 'ABCD'
   )
  end

  scenario "User enters login credentials" do

    visit '/login'
    fill_in 'email', with: 'russell@test.com'
    fill_in 'password', with: 'ABCD'
    click_on 'Submit'
    # commented out b/c it's for debugging only
    save_screenshot "Login.png"

    expect(page).to have_content('Logged In')
  end
end