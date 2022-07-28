require 'rails_helper'

RSpec.describe 'Posts index page: ', type: :feature do
  before(:each) do
    @user = User.create(name: 'Samuel Alemu', photo: '#', bio: 'A web dev', postsCounter: 0)
    @post_one = Post.create(title: 'Post one', text: 'Text body one', user_id: @user.id, commentsCounter: 0,
                            likesCounter: 0)
    @post_two = Post.create(title: 'Post two', text: 'Text body two', user_id: @user.id, commentsCounter: 0,
                            likesCounter: 0)
    @post_three = Post.create(title: 'Post three', text: 'Text body three', user_id: @user.id, commentsCounter: 0,
                              likesCounter: 0)
    @post_four = Post.create(title: 'Post four', text: 'Text body four', user_id: @user.id, commentsCounter: 0,
                             likesCounter: 0)
    @post_five = Post.create(title: 'Post five', text: 'Text body five', user_id: @user.id, commentsCounter: 1,
                             likesCounter: 0)
  end

  it 'shows profile picture of the user' do
    visit user_posts_path(@user.id)
    expect(page).to have_selector("img[src='#{@user.photo}']")
  end

  it 'shows username of the user' do
    visit user_posts_path(@user.id)
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts for the user' do
    visit user_posts_path(@user.id)
    expect(page).to have_content('5')
  end

  it "shows post's title" do
    visit user_posts_path(@user.id)
    expect(page).to have_content('posts')
  end

  it "shows some of the post's body" do
    visit user_posts_path(@user.id)
    expect(page).to have_content(Post.first.text)
  end

  it 'shows the first comment on a post' do
    visit user_posts_path(@user.id)
    @comment = Comment.create(text: 'Comment one', user: @user, post: @post_five)
    expect(@post_five.commentsCounter).to eq(1)
  end

  it 'show how many likes a post has' do
    visit user_posts_path(@user.id)
    expect(page).to have_content '0'
  end
end
