Rails.application.routes.draw do
  get '/welcome', to: "welcome#home", as: "welcome_page"
  root to: "welcome#home"

  delete '/cookbook_recipe_delete/:recipe_id/:id', to: "cookbook_recipes#destroy", as: "delete_cookbook_recipe"
  devise_for :users, controllers: { :omniauth_callbacks => "callbacks"}


  resources :recipes
  resources :cookbooks

  resources :cookbooks, only: [:show] do
    resources :recipes, only: [:new, :show, :index, :edit, :update, :destroy]
  end
end
