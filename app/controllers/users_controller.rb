class UsersController < ApplicationController
  def new
  	unless user_signed_in? || admin_signed_in? || brand_signed_in?
  		redirect_to new_session_path(:user)
  	end
  end  
end
