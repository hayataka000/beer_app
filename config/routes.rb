Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top_page#index'
  resources :reviews, only: [:index, :show] do
  end
end
