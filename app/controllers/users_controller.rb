class UsersController < ApplicationController
	before_action :signed_in_user, only: :new 
  def new
  end

  private
  def signed_in_user
  	unless user_signed_in?
  		redirect_to(new_user_session_path)
  	end
  end
end
