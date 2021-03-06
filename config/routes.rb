Rails.application.routes.draw do


  resources :ratings
  get 'sessions/new'
  root 'posts#index', as: 'home'
  get '/createaccount', to: 'authors#new', as: 'log_in'


  get 'signup', to: 'authors#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions



  resources :authors
  resources :posts do
    get 'vote', to: 'ratings#vote'
    get "search", on: :collection
    resources :comments do
    member do
      get  :add
      post :publish
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
