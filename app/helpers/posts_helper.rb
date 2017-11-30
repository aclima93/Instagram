module PostsHelper
	def like_toggle_path(post)
		like_toggle_path = if current_user.liked? post
												 dislike_post_path(post)
											 else
												 like_post_path(post)
											 end
	end

	def like_icon_for_post(post)
		if current_user.liked? post
			'glyphicon-heart'
		else
			'glyphicon-heart-empty'
		end
	end

	def display_likes(post)
		if post.get_likes.size < 9
			list_likers_of post
		else
			count_likers_of post
		end
	end

	def list_likers_of(post)
		# votes variable is set to the likes by users.
		votes = post.votes_for.up.by_type(User)
		# set user_names variable as an empty array
		user_names = []
		# unless there are no likes, continue below.
		unless votes.blank?
			# iterate through the voters of each vote (the users who liked the post)
			votes.voters.each do |voter|
				# add the user_name as a link to the array
				user_names.push(profile_link(voter))
			end
			# present the array as a nice sentence using the as_sentence method and also make it usable within our html.  Then call the like_plural method with the votes variable we set earlier as the argument.
			user_names.to_sentence.html_safe + like_plural(votes)
		end
	end

	def count_likers_of(post)
		'like'.pluralize(post.likes)
	end

	private

	def like_plural(votes)
		# If we more than one like for a post, use ' like this'
		return ' like this' if votes.count > 1
		# Otherwise, return ' likes this'
		' likes this'
	end
end
