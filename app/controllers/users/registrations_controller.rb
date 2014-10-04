class Users::RegistrationsController < Devise::RegistrationsController

	def create
		super do |resource|
			p = sign_up_params
			if p[:role].nil?
				@user_role = Role.find_by(name: "person")
				resource.update role_id: @user_role.id
			else
				@user_role = Role.find_by(name: p[:role] )
				resource.update role_id: @user_role.id
			end
		end
	end

	private

  	def sign_up_params
  		params.require(:user).permit(:email, :password, :password_confirmation, :role)
  	end

  	def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  	end
end
