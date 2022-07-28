require 'rails_helper'

RSpec.describe 'Posts Controller', type: :request do
  describe 'GET /index' do

    before(:each) do
      @user = User.create(name:"Justion", photo: "png", bio: "Software Dev", postsCounter: 0)
      @post = Post.create(user_id: @user.id, title: "first post", commentsCounter: 0)
    end

    it "Redirects to the user posts' page" do
      get "/users/#{@user.id}/posts"
      expect(response).to render_template(:index)
      # expect(response.body).to include('Comments: x, Likes: x')
    end

    it 'GET users/id/posts should succeed' do
      get "/users/#{@user.id}/posts"
      expect(response).to have_http_status(:ok)
    end

    it 'does not render a different template' do
      get "/users/#{@user.id}/posts"
      expect(response).to_not render_template(:show)
    end
  
    it 'Redirects to the posts profile page' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to render_template(:show)
    end

    it 'GET users/id/posts/id should succeed' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to have_http_status(:ok)
    end

    it 'does not render a different template' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to_not render_template(:index)
    end
  end
end
