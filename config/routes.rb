Rails.application.routes.draw do
  resources :profiles
  resources :analytics
  resources :comments
  resources :pages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
