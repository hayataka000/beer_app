Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top_page#index'

  resources :reviews, only: [:index,:new,:create,:show, :edit, :update, :destroy]
  resources :mypages, only: [:index]
  resources :search, only: [:index] do
  end
end
