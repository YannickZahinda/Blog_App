require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    @user = User.create(name:"Justion", photo: "png", bio: "Software Dev", postsCounter: 0)
    Post.new(title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0, user_id: @user.id)
  end

  before { subject.save }

  it 'title should be present' do
    subject.text = 'This is my first post'
    expect(subject).to be_valid
  end

  it 'title should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
