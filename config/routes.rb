Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :products do
    resources :orders, only: [:index, :create]
  end
end
