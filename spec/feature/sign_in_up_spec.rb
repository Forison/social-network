# frozen_string_literal: true

# frozen_string_literal: true.
require 'rails_helper'

RSpec.feature 'login or sign up ' do
  scenario 'visit and sign in' do
    visit new_user_registration_path
    within 'div#signin_form-wrap' do
      fill_in 'email', with: 'kofi@gmail.com'
      fill_in 'user[password]', with: 'qwertyuiop'

      click_button 'Log In'

      expect(page).to have_title('| facebook')
    end
  end
end
