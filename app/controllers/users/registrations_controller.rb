class Users::RegistrationsController < Devise::RegistrationsController

	def create
		super do |resource|
			@user_role = Role.find_by(name: "user")
			p = sign_up_params
			resource.update role_id: @user_role.id
		end
	end

	private

  	def sign_up_params
  		params.require(:user).permit(:email, :password, :password_confirmation)
  	end

  	def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  	end
end
