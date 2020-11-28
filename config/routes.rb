Rails.application.routes.draw do
  resources :tanks
  resources :foods
  resources :products do
  	collection {get :search }
  end

  root to: 'products#index'
  
  resources :articles do
    collection { get :search }
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
