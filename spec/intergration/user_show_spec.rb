require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  describe 'User' do
    before(:each) do
      @photo = 'avatar.png'
      @user1 = User.create! name: 'grayce', photo: @photo, password: '123456789', email: 'grayce@yahoo.com',
                            bio: 'test bio', confirmed_at: Time.now
      visit('/users/sign_in')
      fill_in 'Email', with: 'grayce@yahoo.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'

      @post1 = Post.create!(author: @user1, title: 'test title 1', text: 'test text 1', likes_counter: '0',
                            comments_counter: '0')
      @post2 = Post.create!(author: @user1, title: 'test title 2', text: 'test text 2', likes_counter: '0',
                            comments_counter: '0')
      @post3 = Post.create!(author: @user1, title: 'test title 3', text: 'test text 3', likes_counter: '0',
                            comments_counter: '0')
      click_on 'grayce'
    end

    it 'shows the username of the user' do
      expect(page).to have_content('grayce')
    end

    it 'shows the photo for ther user' do
      image = page.all('img')
      expect(image.size).to eql(0)
    end

    it 'shows number of posts for the user' do
      expect(page).to have_content('grayce')
    end

    it 'shows the bio for the user' do
      expect(page).to have_content('test bio')
    end

    it 'Should see the first 3 posts for the user.' do
      expect(page).to have_content 'test title 1'
      expect(page).to have_content 'test title 2'
      expect(page).to have_content 'test title 3'
    end

    it 'Can see a button that lets me view all of a users posts' do
      expect(page).to have_button('See all posts')
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s show page.' do
      expect(page).to have_content 'grayce'
    end
  end
end
