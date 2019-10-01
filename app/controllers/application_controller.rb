# frozen_string_literal: true

# frozen_string_literal: true.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :new_signup_params, if: :devise_controller?
  include ApplicationHelper
  protected

  def new_signup_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[lastname firstname dob gender])

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit({ avatar: [] }, :lastname, :firstname, :dob, :gender)
    end
  end
end
