class Users::RegistrationsController < Devise::RegistrationsController

	def create
		super do |resource|
			p = sign_up_params
			unless p[:first_name].nil?
				resource.update first_name: p[:first_name].downcase
			end
			unless p[:last_name].nil?
				resource.update last_name: p[:last_name].downcase
			end
		end
	end

	def update
		super do |resource|
			p = account_update_params
			unless p[:first_name].nil?
				resource.update first_name: p[:first_name].downcase
			end
			unless p[:last_name].nil?
				resource.update last_name: p[:last_name].downcase
			end
		end
	end

	private

  	def sign_up_params
  		params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  	end

  	def account_update_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :current_password)
  	end
end
