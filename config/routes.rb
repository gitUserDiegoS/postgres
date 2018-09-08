Rails.application.routes.draw do
  
  devise_for :appusers
  resources :users
  resources :articles do
    resources :comments, only: [:create, :update, :destroy, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'hora', to: 'welcome#index'
  root 'welcome#index'
end
