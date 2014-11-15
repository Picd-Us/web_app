class Admins::RegistrationsController < Devise::RegistrationsController
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
			unless p[:first_name].nil?
				resource.update first_name: p[:first_name].downcase
			end
			unless p[:last_name].nil?
				resource.update last_name: p[:last_name].downcase
			end
			unless p[:position].nil?
				resource.update position: p[:position]
			end
			unless p[:phone_number].nil?
				resource.update phone_number: p[:phone_number]
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
			unless p[:position].nil?
				resource.update position: p[:position]
			end
			unless p[:phone_number].nil?
				resource.update phone_number: p[:phone_number]
			end
		end
	end

	private

	def sign_up_params
		params.require(:admin).permit(:email, :first_name, :last_name, :position, :phone_number, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:admin).permit(:email, :first_name, :last_name, :position, :phone_number, :password, :password_confirmation)
	end
end
