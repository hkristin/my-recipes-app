Rails.application.routes.draw do
  get '/welcome', to: "welcome#home", as: "welcome_page"
  root to: "welcome#home"

  resources :cookbook_recipes
  resources :recipes
  resources :cookbooks
  devise_for :users, controllers: { :omniauth_callbacks => "callbacks"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cookbooks, only: [:show] do
  resources :recipes, only: [:show, :index, :edit, :update, :destroy]
 end
end
