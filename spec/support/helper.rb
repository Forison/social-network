# frozen_string_literal: true

def log_in(user)
  visit 'users/sign_in'
  within 'div#signin-form-wrap' do
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log In'
  end
  expect(page).to have_text('Signed in successfully')
end
