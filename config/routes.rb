Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'profile#my_address'

  namespace :profile do
    post 'assign_address'
  end

  namespace :api do
    post 'login', to: 'sessions#login'

    namespace :profile do
      post 'assign_address'
    end
  end
end
