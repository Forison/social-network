# frozen_string_literal: true.
class ApplicationController < ActionController::Base
  before_action :new_signup_params, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def new_signup_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname, :firstname, :dob, :gender])

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit({ avatar: [] }, :lastname, :firstname, :dob, :gender)
    end
  end
end
