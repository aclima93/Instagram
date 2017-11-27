module ProfilesHelper

	def profile_link(user)
		link_to user.user_name, profile_path(user.user_name)
	end

	def profile_avatar_select(user)
		if user.avatar.exists?
			image_url = user.avatar.url(:medium)
		else
			image_url = 'default-avatar.jpg'
		end
		return image_tag image_url, id: 'image-preview', class: 'img-responsive img-circle profile-image'
	end

end
