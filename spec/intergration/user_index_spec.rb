require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  describe 'User' do
    before(:each) do
      @photo = 'avatar.png'
      @user1 = User.create! name: 'grayce', photo: @photo, password: '123456789',
                            email: 'mango@yahoo.com', posts_counter: 0, confirmed_at: Time.now
      @user2 = User.create! name: 'other user', photo: @photo, password: '1234567', email: 'mango2@yahoo.com',
                            confirmed_at: Time.now
      visit('/users/sign_in')
      fill_in 'Email', with: 'mango@yahoo.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'
      visit root_path
    end

    it 'shows the username of other users' do
      expect(page).to have_content('grayce')
      expect(page).to have_content('other user')
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(0)
    end

    it 'show users page when clicked' do
      click_on 'grayce'
      expect(page).to have_current_path user_path(@user1)
    end

    it 'show users page when clicked' do
      click_on 'grayce'
      expect(page).to have_current_path user_path(@user1)
    end
  end
end
