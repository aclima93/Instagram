Rails.application.routes.draw do

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

	# notifications routes
	get 'notifications', to: 'notifications#index'
	get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through

	# WARNING - since the profiles use any unmatched string as a username, these routes have to be the last thing to be checked!
	# profiles routes
	get 'profiles/show'
	get ':user_name', to: 'profiles#show', as: :profile
	get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
	patch ':user_name/edit', to: 'profiles#update', as: :update_profile

end
