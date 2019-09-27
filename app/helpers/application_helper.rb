# frozen_string_literal: true.
module ApplicationHelper
  def is_signup_path?
    return true if request.original_url.include?("users/sign_up")
    false
  end
end
