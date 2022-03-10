Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "pages#index"
  resources :bookmarks
  resources :social_links
  resources :settings
  resources :readers
  resources :profiles
  resources :analytics
  resources :comments
  resources :pages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
