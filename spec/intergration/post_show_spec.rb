require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'Grayce', photo: 'avatar.png', password: '12345678', email: 'gra11@yahoo.com',
                            bio: 'test bio', confirmed_at: Time.now
      @user2 = User.create! name: 'Anthony', photo: 'avatar.png', password: '88888888', bio: 'test bio 2',
                            email: 'mango@yat.com', confirmed_at: Time.now
      visit new_user_session_path
      fill_in 'Email', with: 'gra11@yahoo.com'
      fill_in 'Password', with: '12345678'
      click_button 'Log in'

      @post1 = @user1.posts.create!(title: 'hello', text: 'hello', comments_counter: 1, likes_counter: 1)
      @post2 = @user1.posts.create!(title: 'apples', text: 'apples', comments_counter: 1, likes_counter: 1)
      @post3 = @user1.posts.create!(title: 'veggies', text: 'veggies', comments_counter: 1, likes_counter: 1)

      @comment1 = @post1.comments.create!(text: 'test comment 1', user_id: @user1.id)
      @comment2 = @post1.comments.create!(text: 'test comment 2', user_id: @user1.id)
      @comment3 = @post1.comments.create!(text: 'test comment 3', user_id: @user1.id)
      @like1 = @post1.likes.create!(user_id: @user1.id)
    end

    it 'can see who wrote the post.' do
      expect(page).to have_content('Grayce')
    end

    it 'can see the username of each commentor' do
      expect(page).to have_content('Grayce')
    end
  end
end
