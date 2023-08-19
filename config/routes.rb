Rails.application.routes.draw do
  resources :profile_users
  resources :companies, only: [:new, :edit, :create, :update]
  resources :positions do
    resources :applicants, only: [:index]
  end
  resources :applicants, only: [:new, :create]

  devise_for :users, controllers: { registrations: 'user' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'home#index'

  get "/vaga/:slug", to: "positions#public_position", as: :public_position
end
