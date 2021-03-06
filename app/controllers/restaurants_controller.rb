class RestaurantsController < ApplicationController

	before_action :authenticate_admin, only: [:new, :edit, :update, :delete, :create]
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
		
		@rest = Restaurant.find(params[:id])
		

	end

	def new
		
	end

	def create
		
	end

	def edit
		
	end

	def update
		
	end

	def delete
		
	end

	def search
		
		if params[:search] && params[:search][:query] != ""

			query = params[:search][:query]
			if query.to_i != 0 && query.to_i < 500
				
				@rest = Restaurant.find(params[:search][:query])

			end
		elsif params[:filter]

			case params[:filter]
			when "news"

				@blogs = Blog.all.order('created_at DESC').limit(30)


			when "hot"

				@blogs = Blog.all.order('hot_count DESC').limit(30)
					
			end
			
		end
		
	end


end
