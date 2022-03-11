require 'rails_helper'

RSpec.describe 'Login Features', type: :feature do
  it 'Test username & password inputs and the "Submit" button.' do
    visit new_user_session_path
    expect(page).to have_field('Email', type: 'email')
    expect(page).to have_field('Password', type: 'password')
    expect(page).to have_button('Log in', type: 'submit')
  end

  it 'Get error when I click the submit button without filling in the username and the password' do
    visit new_user_session_path
    fill_in('Email', with: '')
    fill_in('Password', with: '')
    click_button('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'Get error when I click the submit button after filling in the username and the password with incorrect data' do
    visit new_user_session_path
    fill_in('Email', with: 'jade@mango.com')
    fill_in('Password', with: '1234567')
    click_button('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'Should redirected to the root page when clicking submit button with correct data' do
    visit new_user_session_path
    fill_in('Email', with: 'mandy@mango.com')
    fill_in('Password', with: '000000')
    click_button('Log in')
    expect(current_path).to have_content('/users')
  end
end
