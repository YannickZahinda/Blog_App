require 'rails_helper'

RSpec.describe 'user_index', type: :feature do
  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'john1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  it 'list all usernames ' do
    expect(page).to have_content('John2')
    expect(page).to have_content('John3')
  end

  it 'The page should include All users' do
    expect(page.html).to include('All users')
  end

  it 'View a specific user post' do
    user = User.all.first
    expect(page).to have_content("Number of posts:#{user.postsCounter || 0}")
  end

  it 'Should show aspecific user when a user card is clicked' do
    user = User.all.first
    first(:link, user.name).click
    expect(page.current_path).to eql(user_path(id: user.id))
  end
end
