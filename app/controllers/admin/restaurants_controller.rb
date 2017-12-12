class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @restaurants = Resturant.all
  end

  def new
    @restaurant = Resturant.new
  end
  
  def create
   @restaurant = Resturant.new(restaurant_params)
   if @restaurant.save
     flash[:notice] = "restaurant was successfully created"
     redirect_to admin_restaurants_path
   else
     flash.now[:alert] = "restaurant was failed to create"
     render :new
   end
 end

 private

 def restaurant_params
   params.require(:resturant).permit(:name, :seat, :phone, :description, :photo,
      :minimum_order, :dining_time, :close_time, :open_time)
 end


end
