Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace,
        defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :bookmarks

      resources :social_links

      resources :settings

      resources :readers

      resources :profiles

      resources :analytics

      resources :comments

      resources :pages
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  ActiveAdmin.routes(self)
  root to: "pages#index"
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
