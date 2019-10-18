# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'visit general feed' do
  before do
    @user_one = create(:user)
    @user = create(:user)
    @auth_user = log_in @user
  end
  scenario 'visit send request' do
    visit users_path

    click_on 'Add friend'
    expect(page).to have_text('Pending')
  end
  scenario 'Accept friend request' do
    visit root_path
    within 'nav#nav' do
      click_button 'bell'
    end
    expect(page).to have_css '#notification'
  end
end
