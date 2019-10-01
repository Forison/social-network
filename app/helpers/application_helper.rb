# frozen_string_literal: true

# frozen_string_literal: true.
module ApplicationHelper
  def signup_path?
    return true if request.original_url.include?('users/sign_up')

    false
  end

  def user_like_post?(one, two, three)
    return true if Like.where(status: one).where(user_id: two).where(post_id: three).exists?

    false
  end

  def unlike_id(one, two, three)
    Like.where(status: one).where(user_id: two).where(post_id: three).ids
  end
end
