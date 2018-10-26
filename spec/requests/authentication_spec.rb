require 'rails_helper'

RSpec.describe 'POST /api/login', type: :request do
  let(:user) { create :user }
  let(:url) { '/api/login' }
  let(:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end
  let(:wrong_params) do
    {
      user: {
        email: user.email,
        password: 'wrong user password'
      }
    }
  end

  context 'when params are correct' do
    before do
      post url, params: params
    end

    it 'returns 200' do
      expect(response).to be_success
    end

    it 'returns JTW token in authorization header' do
      expect(json['token']).to be_present

      decoded_token = JwtService.decode token: json['token']
      expect(decoded_token['user_id']).to eq user.id
    end
  end

  context 'when login params are incorrect' do
    before { post url, params: wrong_params }

    it 'returns unathorized status' do
      expect(response.status).to eq 401
    end
  end
end
