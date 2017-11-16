Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  root 'posts#index'
  root 'posts#new'
  devise_for :users, :controllers => { registrations: 'registrations' }
end
