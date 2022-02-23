RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get user_posts_path(10) }

    it 'should return http status success' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the index template' do
      expect(response).to render_template('index')
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include('Post interactions for a given user')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_post_path(10, 10) }

    it 'should return http status success' do
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
