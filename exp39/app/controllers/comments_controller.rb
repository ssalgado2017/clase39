class CommentsController < ApplicationController
		load_and_authorize_resource

	def create
		@post = Post.find(params[:post_id])
		@user = current_user
		@comment = @post.comments.build(comment_params)
		@comment.user = @user
		respond_to do |format|
      		if @comment.save
        		format.html { redirect_to @post, notice: 'Comment was successfully created.' }
      		else
        		format.html { redirect_to @post, alert: 'Error al crear el comentario.' }
      		end
    	end
	end

	protected

	def comment_params
		params.require(:comment).permit(:description) 
	end


end
