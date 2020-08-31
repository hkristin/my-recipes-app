class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_cookbook, only: [:new, :show, :edit]
  before_action :set_cookbook_recipe, only: [:show, :edit, :update]

    def index
      if user_signed_in?
        @recipes = Recipe.all
      else
        redirect_to new_user_session_path
     end
   end

   def new
     @recipe = @cookbook.recipes.build
     @recipe.cookbook_recipes.build
   end

   def create
     cookbook_id = recipe_params["cookbook_recipes_attributes"]["cookbook_id"]
     @cookbook = Cookbook.find_by(id: cookbook_id)
     @recipe = @cookbook.recipes.build(recipe_params)
     if @recipe.save
       redirect_to cookbook_path(@cookbook)
     else
       render :new
     end
   end

   def show
   end

   def edit
   end

   def update
     if @recipe.update(recipe_params)
       cookbook_id = @recipe.cookbook_recipes.all.last.cookbook_id
       @cookbook = current_user.cookbooks.find_by(id: cookbook_id)
       redirect_to cookbook_recipe_path(@cookbook, @recipe)
     else
       render :edit
     end
   end

   def destroy
     @recipe.destroy
     redirect_to cookbooks_path
   end


 private
   def recipe_params
     params.require(:recipe).permit(
       :name,
       :ingredients,
       :cook_method,
       :difficulty,
       cookbook_recipes_attributes: [
         :id,
         :cookbook_id,
         :cook_time,
         :prep_time
       ]
     )
   end

   def set_recipe
     @recipe = Recipe.find_by(id: params[:id])
   end

   def set_cookbook
     @cookbook = current_user.cookbooks.find_by(id: params[:cookbook_id])
   end

   def set_cookbook_recipe
     @cookbook_recipe = CookbookRecipe.find_by(cookbook_id: params[:cookbook_id], recipe_id: params[:id])
   end
end
