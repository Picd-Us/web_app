class Users::RegistrationsController < Devise::RegistrationsController

	def create
		super do |resource|
			@user_role = Role.find_by(name: "user")
			p = sign_up_params
			if p[:role].nil?
				resource.update role_id: @user_role.id
			else
				resource.update role_id: Role.find_by(name: p[:role].downcase).id
			end
		end
	end

	private

  	def sign_up_params
  		params.require(:user).permit(:email, :role, :password, :password_confirmation)
  	end

  	def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  	end
end
