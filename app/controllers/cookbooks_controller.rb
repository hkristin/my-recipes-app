class CookbooksController < ApplicationController
  before_action :set_cookbook

  def index
    if user_signed_in?
      @cookbooks = current_user.cookbooks
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @cookbook = current_user.cookbooks.build
  end

  def create
      @cookbook = current_user.cookbooks.build(cookbook_params)
      if @cookbook.save && !cookbook_params["recipe_ids"].empty?
        cookbook_params["recipe_ids"].each do |i|
       next if i.empty?
       @recipe = Recipe.find_by(id: i)
       @cookbook.cookbook_recipes.find_by(recipe_id: @recipe.id).update(cook_time: 0, prep_time: 0)
      end

     redirect_to cookbooks_path
    else
      render :new
   end
  end

  def show

  end

  def edit
    @cookbook = Cookbook.find_by(id: params[:id])
  end

  def update
    cookbook = Cookbook.find_by(id: params[:id])
    cookbook.update(cookbook_params)
    redirect_to 'cookbooks#show'
  end

  def destroy
    @cookbook.destroy
    redirect_to 'cookbooks#show'
  end

  private

    def cookbook_params
      params.require(:cookbook).permit(
        :title,
        recipe_ids: [],
        recipes_attributes: [
          :id,
          :name,
          :ingredients,
          :cook_method,
          :difficulty,
          cookbook_recipes_attributes: [:id, :cook_time, :prep_time]
        ]
      )
    end

    def set_cookbook
      @cookbook = Cookbook.find_by(params[:id])
    end
end
