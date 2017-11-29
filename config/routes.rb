Rails.application.routes.draw do
  get 'profiles/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'posts#index'
  root 'posts#new'

  resources :posts do
    resources :comments
    member do
      get 'like'
      get 'dislike'
    end
  end

  # profiles routes
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile
end
