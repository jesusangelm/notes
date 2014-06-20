module ApplicationHelper

  def empty_profile?(user)
    user.nil?
  end

  def show_name_or_email
    if empty_profile?(current_user.profile)
      return current_user.email
    else
      return current_user.profile.name
    end
  end

end
