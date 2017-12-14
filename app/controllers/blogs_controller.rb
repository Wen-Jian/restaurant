class BlogsController < ApplicationController

	def index
		
	end

	def show

		@blog = Blog.find(params[:id])
		unless current_user
			session[:restaurant_id] = params[:restaurant_id]
			session[:blog_id] = params[:id]
		end

		@comments = Blog.includes(:commments).find(params[:id])
		
		
	end

	def new
		
		@blog = Blog.new


	end

	def create
		
		@blog = Blog.new(blog_param)

		if @blog.save

			redirect_to user_path(current_user.id)

		else

			render :action => :new

		end
		


	end

	private

	def blog_param

		params.require(:blog).permit(:title, 
			    :description, :restaurant_id,
			    :user_id )
		
	end

end
