Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/(:user_entry)', to: 'welcome#show'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'

  root 'static_pages#index'
  resources :gossips do
    resources :comments
  end
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
end
