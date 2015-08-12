class LinksController < InheritedResources::Base

	def create
		user = current_user
		@link = current_user.links.create(link_params)
		if @link.save
			redirect_to :root
		end
	end

	def index
		@links = Link.all.order(created_at: :desc)
	end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end
end

