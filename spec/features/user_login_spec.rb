require 'rails_helper'

RSpec.feature "User logs in", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create! first_name: 'First', last_name: 'Last', email: 'email@email.com', password: 'password', password_confirmation: 'password'
  end

  scenario "They are able to log in" do
    # ACT
    visit root_path
    expect(page).to have_content 'Login', count: 1

    click_link("Login")
    expect(page).to have_content 'Email', count: 1

    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Login'

    # DEBUG
    # save_screenshot

    # VERIFY
    expect(page).to have_content 'First', count: 1
    expect(page).to have_content 'Logout', count: 1
  end

end