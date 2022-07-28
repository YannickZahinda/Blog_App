require 'rails_helper'

RSpec.describe 'Show post page: ', type: :feature do
  before(:each) do
    @user = User.create(name: 'Samuel Alemu', photo: '#', bio: 'A web dev', postsCounter: 0)
    @post = Post.create(title: 'Post one', text: 'Text body one', user_id: @user.id, commentsCounter: 0,
        likesCounter: 0)
    @comment_one = Comment.create(post: @post, user: @user, text: 'Comment one')
    @comment_two = Comment.create(post: @post, user: @user, text: 'Comment two')
    @comment_three = Comment.create(post: @post, user: @user, text: 'Comment three')

    @comment_one.save!

    visit "/users/#{@user.id}/posts/#{@post.id}"
  end

  it 'shows the name of the author' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the posts title' do
    expect(page).to have_content(@post.commentsCounter)
  end

  it 'shows the posts body' do
    expect(page).to have_content(@post.text)
  end

  it 'shows the number of comments for a post' do
    expect(page).to have_content(@post.commentsCounter)
  end

  it 'shows the number of likes for a post' do
    expect(page).to have_content(@post.likesCounter)
  end

  it 'shows the username of each commenter on a post' do
    expect(page).to have_content(@user.name)
  end

  it 'should display comment for each commenter' do
    comment = @post.comments.where(user_id: @user).first
    expect(page).to have_content(comment.text)
  end
end
