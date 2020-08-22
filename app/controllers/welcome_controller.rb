class WelcomeController < ApplicationController

def home
   redirect_to cookbooks_path if user_signed_in?
 end

end
