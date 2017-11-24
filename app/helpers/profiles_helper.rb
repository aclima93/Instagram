module ProfilesHelper

	def profile_link(user)
		link_to user.user_name, profile_path(user.user_name)
	end

end
