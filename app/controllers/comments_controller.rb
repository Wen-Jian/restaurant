class CommentsController < ApplicationController

	def create


		@comment = Commment.new(comment_params)

		if @comment.save

			respond_to do |format|	
				blog = Blog.find(@comment.blog_id)
				blog[:hot_count] += 1
				blog.save
				# redirect_to restaurant_blog_path(params[:comment][:rest_id], params[:comment][:blog_id])
			
				format.json{render json: @comment}
			end
		else

			render :controller => blogs, :action => :show
		end	
		
		
		
	end

	private

	def comment_params

		params.require(:comment).permit(:user_id, :blog_id, :commenter)
		
	end

end
