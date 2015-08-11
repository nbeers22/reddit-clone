class LinksController < InheritedResources::Base

	def create
		user = current_user
		# user = User.find(params[:id])
		@link = current_user.links.create(link_params)
		if @link.save
			redirect_to :root
		end
	end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end
end

