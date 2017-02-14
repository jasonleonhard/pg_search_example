Rails.application.routes.draw do
  resources :galleries
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'galleries#index'
end
