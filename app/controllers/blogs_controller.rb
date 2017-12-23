class BlogsController < ApplicationController

	def index
		
		if current_user

			if session[:restaurant_id]

				@rest_id = session[:restaurant_id]
				@blog_id = session[:blog_id]
				session[:restaurant_id] = nil
				session[:blog_id] = nil
				redirect_to restaurant_blog_path(@rest_id, @blog_id)

			end
			
		end

		@newblogs = (Blog.all).order('created_at DESC').limit(6)
		
		@hotblogs = (Blog.all).order('hot_count DESC').limit(6)

		@eva = Restaurant.all.order('eva DESC').limit(20)
		
	end

	def show

		@blog = Blog.find(params[:id])
		unless current_user
			session[:restaurant_id] = params[:restaurant_id]
			session[:blog_id] = params[:id]
		end

		@comments = Blog.includes(:commments).find(params[:id])
		respond_to do |f|

			f.json{render json: @blog}
			f.html{render :show}
		end

	end

	def new
		
		@blog = Blog.new


	end

	def create
		
		if params[:commit] == "vote"

			@eva = Evaluation.create(eva_param)
			if @eva.level > 5

				@eva.level = 5

			end
			if @eva.save 


				@rest = Restaurant.find(params[:eva][:restaurant_id])
				@rest.eva = (@rest.eva + @eva.level.to_i)/2
				@rest.save
				redirect_to restaurant_path(params[:eva][:restaurant_id])
				
			end
			

		else
			@blog = Blog.new(blog_param)

			if @blog.save

				redirect_to user_path(current_user.id)

			else

				render :action => :new

			end
		
		end


	end

	def edit

		@blog = Blog.find(params[:id])
		
		
	end

	def update

		@blog = Blog.find(params[:id])
		if @blog.update(blog_param)

			redirect_to restaurant_blog_path(params[:blog][:restaurant_id], params[:id])

		end
		
	end

	private

	def blog_param

		params.require(:blog).permit(:title, 
			    :description, :restaurant_id,
			    :user_id, :photos, :hot_count )
		
	end

	def eva_param

		params.require(:eva).permit(:level, :user_id, :restaurant_id)
		
	end

end
