# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comment testing' do
  before do
    @user = create(:user)
    @auth = log_in @user
    @post = create(:post, user_id: @user.id)
  end

  scenario 'auth user comments on a post' do
    visit posts_path
    fill_in 'comment[commentary]', with: 'hello comment'
    click_on 'send'
    expect(page).to have_text('comment posted')
  end
  scenario 'auth user comments on a post in post show' do
    visit post_path(@post.id)
    fill_in 'comment[commentary]', with: 'hello comment'
    click_on 'send'
    expect(page).to have_text('comment posted')
  end
  scenario 'User unlikes post' do
    create(:like, user_id: @user.id, post_id: @post.id)
    visit post_path(@post.id)
    click_on 'unlike'
    expect(page).to have_text('unliked post')
  end
end
