# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'visit general feed' do
  before do
    @user_1 = create(:user)
    @user = create(:user)
    @auth_user = log_in @user
  end
  scenario 'visit post feed' do
    visit posts_path
    expect(page).to have_css('#post-index')
  end

  scenario 'visit my profile' do
    visit user_path(@user.id)
    expect(page).to have_css('#post-my-profile')
  end

  scenario 'visit my update profile' do
    visit edit_user_registration_path
    expect(page).to have_css('#post-my-profile-edit')
  end
  scenario 'visit my update profile' do
    visit users_path 
    click_on 'Add friend'
    expect(page).to have_text('Pending')
  end
end
