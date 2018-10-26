require 'rails_helper'

RSpec.describe 'POST /api/profile/assign_address', type: :request do
  let(:user) { create :user }
  let(:address) { create :address }
  let(:address_with_user) { create :address, user: user }
  let(:url) { '/api/profile/assign_address' }

  context 'when user is not authorized' do
    before do
      post url
    end

    it 'returns 401' do
      expect(response).to have_http_status(401)
    end
  end

  context 'when address exists' do
    before do
      address
      post url, headers: auth_headers(user)
    end

    it 'returns 204' do
      expect(response).to have_http_status(:no_content)
    end

    it 'assign address to user' do
      address.reload
      expect(address.user_id).to eq user.id
    end
  end

  context "when available address doesn't exists" do
    before do
      address_with_user
      post url, headers: auth_headers(user)
    end

    it 'returns 424' do
      expect(response).to have_http_status(424)
    end

    it 'do not assign address to user' do
      address.reload
      expect(address.user_id).to eq nil
    end
  end
end
