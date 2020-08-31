class CookbookRecipesController < ApplicationController
  def destroy
    @cookbook_recipe = CookbookRecipe.find_by(cookbook_id: params[:recipe_id], recipe_id: params[:id])
    @cookbook_recipe.destroy
    redirect_to cookbook_path((current_user.cookbooks.find_by(id: params[:recipe_id])))
  end
end
