def log_in(user)
  visit new_user_session_path
  within 'div#signin-form-wrap' do
    fill_in 'user[email]', :with => user.email
    fill_in 'user[password]', :with => user.password
    click_button 'Log In'
  end
  expect(page).to have_text('Signed in successfully')
end 