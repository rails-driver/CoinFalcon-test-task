require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
  let(:email) { 'free@email.com' }
  let(:password) { 'password' }

  scenario 'User creates a new account and can login' do
    visit '/users/sign_up'

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    assert_text 'You have signed up successfully'

    click_link 'Logout'

    assert_text 'You need to sign in or sign up before continuing.'

    fill_in 'Email', with: email
    fill_in 'Password', with: password

    click_button 'Log in'

    assert_text 'Signed in successfully.'
  end
end
