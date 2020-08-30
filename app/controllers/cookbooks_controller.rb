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
      @cookbook = current_user.cookbooks.build(cookbook_params)
       if @cookbook.save
         redirect_to cookbooks_path
      else
        render new_cookbook_path
   end
 end

  def show
  end

  def edit
  end

  def update
    if @cookbook.update(cookbook_params)
     redirect_to cookbook_path
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
      )
    end

    def set_cookbook
      @cookbook = Cookbook.find_by(id: params[:id])
    end
end
