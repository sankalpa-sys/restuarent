Rails.application.routes.draw do
  resources :books
  resources :orders
  resources :messages
  resources :reports
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'pages#index'
  get 'pages/about'
  get 'pages/services'
  get 'pages/events'
end
