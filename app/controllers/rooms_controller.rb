class RoomsController < ApplicationController
  
  def posts
    @rooms = Room.where(user_id: current_user.id)
  end
  
  def search
    @area = params["area"]
    @keyword = params["keyword"]
    
    @rooms = search_for(@area, @keyword)
  end
  
  def index
  end
  
  def show
    @room = Room.find(params[:id])
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
  end
  
  def destroy
  end
  
  private
  
  def room_params #ストロングパラメータ
    params.require(:room).permit(:name, :explanation, :fee, :address, :room_image, :user_id)
  end
  
  def search_for(area, keyword)
    Room.where('address LIKE ?', "%#{area}%").where('explanation LIKE ? OR name LIKE ?', "%#{keyword}%", "%#{keyword}%")
  end
end
