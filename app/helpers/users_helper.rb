module UsersHelper
  def job_title_icon
    if @user.profile.profession == "Family"
      "<i class='fa fa-home'></i>".html_safe
    elsif @user.profile.profession == "Friend"
      "<i class='fa fa-group'></i>".html_safe
    elsif @user.profile.profession == "Foe"
      "<i class='fa fa-meh-o'></i>".html_safe
    end
  end
end