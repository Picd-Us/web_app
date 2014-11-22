class DashboardsController < ApplicationController
	def new 
		if brand_signed_in?
			brand_page()
		elsif admin_signed_in?
			admin_page()
		elsif user_signed_in?			
			user_page
		else
			redirect_to new_session_path(:user)
		end		
	end

	def admin_page
		render 'admin_page'
	end

	def user_page
		render 'user_page'
	end

	def brand_page
		render 'brand_page'
	end
end
