# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'login or sign up ' do
  scenario 'visit and sign in' do
    visit new_user_registration_path
    within 'div#signin-form-wrap' do
      fill_in 'email', with: 'kofi@gmail.com'
      fill_in 'user[password]', with: 'qwertyuiop'

      click_on 'Log In'

      expect(page).to have_title('| facebook')
    end
  end

  scenario 'visit and sign up' do
    visit new_user_registration_path
    within 'div#signup-form-wrap' do
      fill_in 'user[lastname]', with: 'kofi'
      fill_in 'user[firstname]', with: 'ama'
      fill_in 'user[email]', with: 'ama@gmail.com'
      choose('user_gender_valuemale')
      fill_in 'user[dob]', with: '12/12/1900'
      fill_in 'user[password]', with: 'qwertyuiop'

      click_on 'Sign up'

      expect(page).to have_title('| facebook')
    end
  end
end
