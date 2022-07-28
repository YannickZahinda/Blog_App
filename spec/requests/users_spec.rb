require 'rails_helper'

RSpec.describe 'Users Controller', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Justion', photo: 'png', bio: 'Software Dev', postsCounter: 0)
      @post = Post.create(user_id: @user.id, title: 'first post', commentsCounter: 0)
    end

    it "Redirects to the users' list page" do
      get "/users/#{@user.id}/posts"
      expect(response).to render_template(:index)
      # expect(response.body).to include('User name')
      # expect(response.body).to include('Number of posts: x')
    end

    it 'GET /users should succeed' do
      get '/users'
      expect(response).to have_http_status(:ok)
    end

    it 'does not render a different template' do
      get '/users'
      expect(response).to_not render_template(:show)
    end

    it 'Redirects to the user profile page' do
      get "/users/#{@user.id}/"
      expect(response).to render_template(:show)
    end

    it 'GET users/id should succeed' do
      get "/users/#{@user.id}/"
      expect(response).to have_http_status(:ok)
    end

    it 'does not render a different template' do
      get "/users/#{@user.id}/"
      expect(response).to_not render_template(:index)
    end
  end
end
