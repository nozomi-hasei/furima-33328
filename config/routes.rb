Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :products, only: [:index, :new, :create, :show, :edit, :destroy] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
