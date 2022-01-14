class MicropostsController < ApplicationController
	def create	
		@micropost = current_user.microposts.new(micropost_params)
			if @micropost.save
				redirect_to root_url
			else
				@microposts = current_user.microposts
				render "users/homefeed"
			end
	end

	def destroy
		@micropost = Micropost.find(params[:id])
		if @micropost 
			@micropost.destroy
			flash[:info] = "Successfully Deleted Micropost!!"
			redirect_to root_url
		end
	end
private 
	def micropost_params
		params.require(:micropost).permit(:content , :picture)
	end
end
