Rails.application.routes.draw do
  get 'pages/dashboard'
  delete 'pages/:user_id/user', to: "pages#destroy", as: "destroy_user"

  devise_for :users
  resources :posts do 
	resources :comments, only: [:create]
  end	
  root "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
