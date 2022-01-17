class RelationshipsController < ApplicationController
	def create
		other_user = User.find(params[:user_id])
		current_user.follow(other_user)

		redirect_to user_url(other_user)
	end

	def destroy
		
		relationship = Relationship.find(params[:id])

		if relationship
			relationship.destroy
			redirect_to request.referer
		end
	end
end
