class Api::SessionsController < Api::ApplicationController

  api :POST, '/login'
  param :user, Hash, desc: 'User credentials', required: true do
    param :email, String, desc: 'Email', required: true
    param :password, String, desc: 'Password', required: true
  end
  returns code: 401, desc: 'Login or password are wrong'
  returns code: 200, desc: 'New token was generated' do
    property :token, String, desc: 'Access token'
  end
  def login
    user = User.find_for_authentication email: user_params[:email]

    if user&.valid_password?(user_params[:password])
      render json: { token: JwtService.encode(user) }
    else
      render status: 401, json: ''
    end
  end

  def user_params
    params.require(:user).permit :email, :password
  end
end
