class CookbooksController < ApplicationController
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
      redirect_to '/index'
  end

  def edit
    @cookbook = Cookbook.find_by(id: params[:id])
  end

  def update
    cookbook = Cookbook.find_by(id: params[:id])
    cookbook.update(cookbook_params)
    redirect_to cookbook_path(cookbook)
  end

  def destroy
    @cookbook.destroy
    redirect_to cookbooks_path
  end

  private
    def cookbook_params
      params.require(:cookbook).permit(
        :title,
        :user_id
      )
    end
end
end
