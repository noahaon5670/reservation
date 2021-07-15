class RoomsController < ApplicationController
  
  def posts
    @rooms = Room.where(user_id: current_user.id)
  end
  
  def search
    @area = params["area"]
    @keyword = params["keyword"]
    
    @rooms = search_for(@area, @keyword)
  end
  
  def show
    @room = Room.find(params[:id])
    @post_user = User.find(@room.user_id)
    @reserve_user = current_user
  end
  
  def new
    @room = Room.new
  end
  
  def edit
    @room = Room.find(params[:id])
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
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_posts_path
    else
    end
  end
  
  def destroy
    @room = Room.find(params[:id])
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
end
