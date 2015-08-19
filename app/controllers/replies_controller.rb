class RepliesController < InheritedResources::Base
	before_filter :authenticate_user!, except: [:index, :show]
	before_action :authorized_user, only: [:edit, :update, :destroy]

	def new
		@link = Link.find(params[:link_id])
		@comment = Comment.find(params[:comment_id])
	end

	def create
		@link = Link.find(params[:link_id])
		@comment = Comment.find(params[:comment_id])
		@reply = @comment.replies.create(reply_params)
		@reply.user = current_user
		@reply.link_id = @link.id
		@reply.save
		if @reply.save
			redirect_to @link
		else
			flash[:error] = "Sorry, there was an error. Please try again. Ref code 857463723834."
		end
	end

	def index
		@comment = Comment.find(params[:comment_id])
		@replies = @comment.replies.all
	end

	def upvote
		@comment = Comment.find(params[:comment_id])
		@reply = Reply.find(params[:reply_id])
		@reply.upvote_by current_user
		redirect_to :back
	end
	 
	def downvote
	  	@comment = Comment.find(params[:comment_id])
	  	@reply = Reply.find(params[:reply_id])
	  	@reply.downvote_by current_user
	  	redirect_to :back
	end

    private

    def reply_params
      params.require(:reply).permit(:body, :user_id, :link_id, :comment_id)
    end
end

