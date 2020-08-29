class CookbooksController < ApplicationController
  before_action :set_cookbook, only: [:show, :edit, :update, :destroy]

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
      @cookbook = current_user.cookbooks.create(cookbook_params)
      # if @cookbook.save && !cookbook_params["recipe_ids"].empty?
      #   cookbook_params["recipe_ids"].each do |i|
      #    next if i.empty?
      #    @recipe = Recipe.find_by(id: i)
      #    @cookbook.cookbook_recipes.find_by(recipe_id: @recipe.id).update(cook_time: 0, prep_time: 0)
      #   end
      #
      #   @cookbook.cookbook_recipes.last.update(cook_time: cookbook_params[:recipes_attributes][:cookbook_recipes_attributes][:cook_time])
      #   @cookbook.cookbook_recipes.last.update(prep_time: cookbook_params[:recipes_attributes][:cookbook_recipes_attributes][:prep_time])
      redirect_to cookbooks_path
   end

  def show
  end

  def edit
  end

  def update
    if @cookbook.update(cookbook_params)
     # cookbook_params["recipe_ids"].each do |i|
     #  next if i.empty?
     #  @recipe = Recipe.find_by(id: i)
     #  @cookbook.cookbook_recipes.find_by(recipe_id: @recipe.id)
     #  end
     # @cookbook.cookbook_recipes.last.update(cook_time: cookbook_params[:recipes_attributes][:cookbook_recipes_attributes][:cook_time])
     # @cookbook.cookbook_recipes.last.update(prep_time: cookbook_params[:recipes_attributes][:cookbook_recipes_attributes][:prep_time])

     redirect_to cookbooks_path
   else
     render :edit
   end
  end

  def destroy
    @cookbook.destroy
    redirect_to cookbooks_path
  end

  private

    def cookbook_params
      params.require(:cookbook).permit(
        :title,
        :author,
        recipe_ids: [],
        # recipes_attributes: [
        #   :id,
        #   :name,
        #   :ingredients,
        #   :cook_method,
        #   :difficulty,
        #   cookbook_recipes_attributes: [:id, :cook_time, :prep_time]
        # ]
      )
    end

    def set_cookbook
      @cookbook = Cookbook.find_by(id: params[:id])
    end
end
