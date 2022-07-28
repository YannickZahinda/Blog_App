require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    @user = User.create(name: 'Justion', photo: 'png', bio: 'Software Dev', postsCounter: 0)
  end

  before { subject.save }

  it 'should save the data' do
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.name = 'Justion'
    expect(subject).to be_valid
  end

  it 'Should have a postsCounter' do
    subject.postsCounter = 0
    expect(subject).to be_valid
  end
end
