require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'Grayce', photo: 'avatar.png', password: '12345678', email: 'gra11@yahoo.com',
                            bio: 'test bio', confirmed_at: Time.now
      visit new_user_session_path
      fill_in 'Email', with: 'gra11@yahoo.com'
      fill_in 'Password', with: '12345678'
      click_button 'Log in'

      @post1 = @user1.posts.create!(title: 'test title 1', text: 'test text 1', comments_counter: 1, likes_counter: 1)
      @post2 = @user1.posts.create!(title: 'test title 2', text: 'test text 2', comments_counter: 1, likes_counter: 1)
      @post3 = @user1.posts.create!(title: 'test title 3', text: 'test text 3', comments_counter: 1, likes_counter: 1)

      @comment1 = @post1.comments.create!(text: 'test comment 1', user_id: @user1.id)
      @comment2 = @post1.comments.create!(text: 'test comment 2', user_id: @user1.id)
      @comment3 = @post1.comments.create!(text: 'test comment 3', user_id: @user1.id)
      @like1 = @post1.likes.create!(user_id: @user1.id)

      click_on 'Grayce'
      click_on 'See all posts'
    end

    it 'shows the username of the user' do
      expect(page).to have_content('Grayce')
    end

    it 'shows posts title' do
      expect(page).to have_content('test title')
    end

    it 'shows the photo for ther user' do
      image = page.all('img')
      expect(image.size).to eql(0)
    end

    it 'can see some of the body for the post.' do
      expect(page).to have_content('test text')
    end

    it 'can see the first comments on a post' do
      expect(page).to have_content('test comment 1')
    end

    it 'can see how many comments a post has' do
      expect(page).to have_content('Comments')
    end

    it 'can see how many likes a post has' do
      expect(page).to have_content('Likes')
    end
  end
end
