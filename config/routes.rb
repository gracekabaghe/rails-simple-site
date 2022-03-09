Rails.application.routes.draw do
  devise_for :users
root to: 'users#index'
  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[create new]
      resources :likes, only: [:create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
