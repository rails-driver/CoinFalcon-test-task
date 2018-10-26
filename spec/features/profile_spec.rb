require 'rails_helper'

RSpec.describe 'Profile', type: :feature do
  let(:user) { create :user }
  let!(:address) { create :address }

  scenario 'User can assign a new address' do
    login user

    assert_text 'No address has been assigned yet'

    click_on 'Assign new address'

    assert_text address.name

    click_on 'Assign new address'

    assert_text /Address Pool empty, please try again in \d+ minute/
  end
end
