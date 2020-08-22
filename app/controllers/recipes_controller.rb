class RecipesController < ApplicationController

    def index
      if user_signed_in?
        @recipes = Recipe.all
      else
        redirect_to new_user_session_path
     end
   end

   def new
   end

   def create
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
     params.require(:recipe).permit(:name, :ingredients, :cook_method, :difficulty)
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
