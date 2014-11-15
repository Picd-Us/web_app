class Brands::RegistrationsController < Devise::RegistrationsController
	before_action :admin_signed_in?, only: :create
	before_action :authenticate_admin!, only: :create

	def new
		unless admin_signed_in?
			redirect_to new_session_path(:admin)
		end
	end

	def create
		super do |resource|
			p = sign_up_params
			unless p[:name].nil?
				resource.update name: p[:name].downcase
			end
		end
	end

	def update
		super do |resource|
			p = account_update_params
			unless p[:name].nil?
				resource.update name: p[:name].downcase
			end
		end
	end

	private

  	def sign_up_params
  		params.require(:brand).permit(:email, :name, :password, :password_confirmation)
  	end

  	def account_update_params
    params.require(:brand).permit(:email, :name, :password, :password_confirmation, :current_password)
  	end
end
