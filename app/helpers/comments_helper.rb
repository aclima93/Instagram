module CommentsHelper

	def profile_link(comment)
		# same purpose, avoids replicated code
		profile_link(comment.post)
	end

end
