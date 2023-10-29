Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :users, only: [] do
    member do
      patch :set_admin
      patch :set_user_type
    end
  end

  root to: "pages#home"
  resources :companies do
    resources :clients
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
