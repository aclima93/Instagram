module ProfilesHelper
  def profile_link(user)
    link_to user.user_name, profile_path(user.user_name), class: 'user-name'
  end

  def profile_avatar_select(user)
    image_url = if user.avatar.exists?
                  user.avatar.url(:medium)
                else
                  'default-avatar.jpg'
                end
    image_tag image_url, id: 'image-preview', class: 'img-responsive img-circle profile-image'
  end
end
