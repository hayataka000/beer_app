Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top_page#index'
  get 'terms', to: 'top_page#terms'
  get 'aboutus', to: 'top_page#aboutus'
  resources :reviews, only: [:index,:new,:create,:show, :edit, :update, :destroy]
  resources :mypages, only: [:index]
  resources :search, only: [:index] do
  end
end
