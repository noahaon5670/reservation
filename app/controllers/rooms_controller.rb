class RoomsController < ApplicationController
  
  before_action :set_room, only[:show, :edit, :update, :destroy]
  
  def posts
    @rooms = Room.where(user_id: current_user.id)
  end
  
  def search
    @area = params["area"]
    @keyword = params["keyword"]
    
    @rooms = search_for(@area, @keyword)
  end
  
  def show
    @post_user = User.find(@room.user_id)
    @reserve_user = current_user
  end
  
  def new
    @room = Room.new
  end
  
  def edit
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to "/"
    else
      render "new"
    end
  end
  
  def update
    if @room.update(room_params)
      redirect_to rooms_posts_path
    else
      
    end
  end
  
  def destroy
    @room.destroy
    redirect_to rooms_posts_path
  end
  
  private
  
  def room_params #ストロングパラメータ
    params.require(:room).permit(:name, :explanation, :fee, :address, :room_image, :user_id)
  end
  
  def search_for(area, keyword)
    Room.where('address LIKE ?', "%#{area}%").where('explanation LIKE ? OR name LIKE ?', "%#{keyword}%", "%#{keyword}%")
  end
  
  def set_room
    @room = Room.find(params[:id])
  end
end
