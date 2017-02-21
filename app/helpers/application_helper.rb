# This is a generic helper available for use in all views.
module ApplicationHelper
  def current_user
    current_login.loginable
  end
  
  def full_title
    [content_for(:title), 'Front Door'].compact.join(' | ')
  end

  def page_title(title)
    content_for :title, title
  end
end
