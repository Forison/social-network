class ApplicationController < ActionController::Base
	before_action :new_signup_params, if: :devise_controller?
	
	protected 
	def new_signup_params
		devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname, :firstname, :dob, :gender])
	end
end
