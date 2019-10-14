require 'rails_helper'

RSpec.feature 'Comment testing' do
  before do
    @user = create(:user)
    @auth = log_in @user
    @post = create(:post, user_id: @user.id)
  end
  scenario 'auth user comments on a post' do
    visit root_path
    fill_in 'comment[commentary]', :with => 'hello comment'
    click_on 'send'
    expect(page).to have_text('comment posted')
  end
end
