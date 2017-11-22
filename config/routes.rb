Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	devise_for :users, :controllers => { registrations: 'registrations' }

	root 'posts#index'
	root 'posts#new'

	resources :posts do
		resources :comments
	end

end
