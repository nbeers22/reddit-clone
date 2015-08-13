class CommentsController < InheritedResources::Base
	before_filter :authenticate_user!, only: [:create]

	def create
		@link = Link.find(params[:link_id])
		@comment = @link.comments.create(comment_params)
		@comment.user = current_user

		if @comment.save
			redirect_to @link
		else
			redirect_to :root
		end
	end

	def edit
		@comment = Comment.find(params[:id])
		@link = Link.find(params[:link_id])
	end

	def update
		@comment = Comment.find(params[:id])
		@comment.update_attributes(comment_params)
		redirect_to @comment.link
	end

	def destroy
		Comment.find(params[:id]).destroy
		redirect_to :back
	end

	def upvote
	  @comment = Comment.find(params[:id])
	  @comment.upvote_by current_user
	  redirect_to :back
	end
	 
	def downvote
	  @comment = Comment.find(params[:id])
	  @comment.downvote_by current_user
	  redirect_to :back
	end

    private

    def comment_params
      params.require(:comment).permit(:body, :link_id, :user_id)
    end
end

