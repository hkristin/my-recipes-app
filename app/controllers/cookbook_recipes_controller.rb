class CookbookRecipesController < ApplicationController
  def destroy
  @cookbook_recipe = CookbookRecipe.find_by(cookbook_id: params[:cookbook_id], recipe_id: params[:id])
  @cookbook_recipe.destroy
  redirect_to cookbook_path(current_user.cookbooks.find_by(id: params[:recipe_id]))
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

end
