# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'like' do
  before do
    @user = create(:user)
    @auth_user = log_in @user
    @post = create(:post, user_id: @user.id)
  end
  scenario 'User likes post on root path' do
    visit root_path
    click_on 'Like'
    expect(page).to have_text('post liked')
  end
  scenario 'User unlikes post root path' do
    create(:like, user_id: @user.id, post_id: @post.id)
    visit root_path
    click_on 'unlike'
    expect(page).to have_text('unliked post')
  end
  scenario 'User likes post' do
    visit posts_path
    click_on 'Like'
    expect(page).to have_text('post liked')
  end
  scenario 'User unlikes post' do
    create(:like, user_id: @user.id, post_id: @post.id)
    visit posts_path
    click_on 'unlike'
    expect(page).to have_text('unliked post')
  end
  scenario 'User likes post' do
    visit post_path(@post.id)
    click_on 'Like'
    expect(page).to have_text('post liked')
  end
  scenario 'User unlikes post' do
    create(:like, user_id: @user.id, post_id: @post.id)
    visit post_path(@post.id)
    click_on 'unlike'
    expect(page).to have_text('unliked post')
  end
end
