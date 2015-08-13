class LinksController < InheritedResources::Base
	before_filter :authenticate_user!, except: [:index, :show]
	before_action :authorized_user, only: [:edit, :update, :destroy]

	def create
		user = current_user
		@link = current_user.links.create(link_params)
		if @link.save
			redirect_to :root
		end
	end

	def index
		@links = Link.all.order(cached_votes_score: :desc)
	end

	def upvote
	  @link = Link.find(params[:id])
	  @link.upvote_by current_user
	  redirect_to :back
	end
	 
	def downvote
	  @link = Link.find(params[:id])
	  @link.downvote_by current_user
	  redirect_to :back
	end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end

    def authorized_user
      @link = current_user.links.find_by(id: params[:id])
      redirect_to links_path, notice: "Not authorized to edit this link" if @link.nil?
    end
end

