Rails.application.routes.draw do
  get '/welcome', to: "welcome#home", as: "welcome_page"
  root to: "welcome#home"
  delete '/cookbook_recipe_delete/:recipe_id/:id', to: "cookbook_recipes#destroy", as: "delete_cookbook_recipe"
  devise_for :users, controllers: { :omniauth_callbacks => "callbacks"}

  resources :recipes
  resources :cookbooks

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cookbooks, only: [:show] do
    resources :recipes, only: [:show, :index, :edit, :update, :destroy]
  end
end
