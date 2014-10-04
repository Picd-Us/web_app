class Users::RegistrationsController < Devise::RegistrationsController

	def create
		super do |resource|
			p = sign_up_params
			if p[:role].nil?
<<<<<<< HEAD
				resource.update role_id: @user_role.id
			else
				resource.update role_id: Role.find_by(name: p[:role].downcase).id
=======
				@user_role = Role.find_by(name: "person")
				resource.update role_id: @user_role.id
			else
				@user_role = Role.find_by(name: p[:role] )
				resource.update role_id: @user_role.id
>>>>>>> sign-up-persons-through-users
			end
		end
	end

	private

  	def sign_up_params
<<<<<<< HEAD
  		params.require(:user).permit(:email, :role, :password, :password_confirmation)
=======
  		params.require(:user).permit(:email, :password, :password_confirmation, :role)
>>>>>>> sign-up-persons-through-users
  	end

  	def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  	end
end
