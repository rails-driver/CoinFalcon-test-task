class Api::SessionsController < Api::ApplicationController
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
