class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end
  
  def create
   @restaurant = Restaurant.new(restaurant_params)
   if @restaurant.save
     flash[:notice] = "restaurant was successfully created"
     redirect_to admin_restaurants_path
   else
     flash.now[:alert] = "restaurant was failed to create"
     render :new
   end
  end

  def edit

    @restaurant = Restaurant.find(params[:id])
    
  end

  def update

    @restaurant =Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)

      redirect_to admin_restaurants_path

    else
      
      render :action => :edit

    end
    
  end

 private

 def restaurant_params
   params.require(:restaurant).permit(:name, :seat, :phone, :description, :photo,
      :minimum_order, :dining_time, :close_time, :open_time)
 end


end
