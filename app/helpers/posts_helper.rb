module PostsHelper

	def profile_link(post)
		link_to post.user.user_name, profile_path(post.user.user_name)
	end

end
