require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }

    it 'should returns http status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the index template' do
      expect(response).to render_template('index')
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1' }

    it 'should return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the show template ' do
      expect(response).to render_template('show')
    end

    it 'should have the correct text in the template' do
      expect(response.body).to include('Profile of')
    end
  end
end

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/1/posts' }

    it 'should return http status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the index template' do
      expect(response).to render_template('index')
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include('Post interactions for a given user ')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1/posts/1' }

    it 'should return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the show template ' do
      expect(response).to render_template('show')
    end

    it 'should have the correct text in the template' do
      expect(response.body).to include('Posts')
    end
  end
end
