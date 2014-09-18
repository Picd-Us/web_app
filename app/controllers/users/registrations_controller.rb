class Users::RegistrationsController < Devise::RegistrationsController
	before_action :configure_permitted_parameters

	def create
		super do |resource|
			@user_role = Role.find_by(name: "user")
			p = sign_up_params
			resource.update first_name: p[:first_name].downcase, last_name: p[:last_name].downcase, role_id: @user_role.id
		end
	end

	private

  	def configure_permitted_parameters
   		devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
  	end

  	def sign_up_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end

  	def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  	end
end
