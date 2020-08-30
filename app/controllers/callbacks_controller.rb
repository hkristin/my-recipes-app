class CallbacksController < ApplicationController

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]

      
      # render allows variables defined in facebook action to be maintained
      render new_user_registration_url
    end
  end

  def failure
    redirect_to new_user_registration_url
  end


end
