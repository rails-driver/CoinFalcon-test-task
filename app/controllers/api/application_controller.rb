class Api::ApplicationController < ActionController::API
  private

  def authenticate_user!
    if request.headers['Authorization']
      decoded_token = JwtService.decode token: request.headers['Authorization']

      if decoded_token.try(:[], 'user_id')
        user = User.find decoded_token['user_id']
        sign_in user, store: false if user
      end
    end

    unless current_user
      render json: { errors: 'Not authorized' }, status: 401
    end
  end
end
