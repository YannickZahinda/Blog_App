require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    @user = User.create(name: 'Justion', photo: 'png', bio: 'Software Dev', postsCounter: 0)
    @post = Post.create(user_id: @user.id, title: 'first post', commentsCounter: 0)
    Like.new(user_id: @user.id, post_id: @post.id)
  end

  before { subject.save }

  it 'should save the data' do
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'post_id should be a string' do
    subject.post_id = '11123'
    expect(subject).to_not be_valid
  end

  it 'user_id should be a string' do
    subject.user_id = '1123'
    expect(subject).to_not be_valid
  end
end
