# require 'rails_helper'

# RSpec.describe Post, type: :model do
#   first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
#   subject { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }

#   before { subject.save }

#   it 'check if the title is not blank' do
#     subject.title = ''
#     expect(subject).to_not be_valid
#   end

#   it 'return the recent comments for a post' do
#     expect(Post.recent_comments(subject.id).count).to eql 0
#   end

#   it 'return all the comments for a post' do
#     expect(Post.all_comments(subject.id).count).to eql 0
#   end
# end
