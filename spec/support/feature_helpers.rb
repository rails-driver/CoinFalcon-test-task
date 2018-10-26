module Feature
  module Helpers
    def login(user)
      visit '/'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end
  end
end
