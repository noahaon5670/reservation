class ReservationsController < ApplicationController
  before_action :set_reserve, only: [:show, :destroy]
  
  def index
    @reserves = Reserve.where(reserve_user_id: current_user.id)
  end
  
  def new
    @reserve = Reserve.new(reserve_params_no_require)
    @room = Room.find(params[:room_id])
  end
  
  def show
  end
  
  def create
    @reserve = Reserve.new(reserve_params_require)
    if @reserve.save
      redirect_to reservation_path(@reserve)
    end
  end
  
  def destroy
    @reserve.destroy
    redirect_to "/"
  end
  
  private
  
  def reserve_params_no_require
    params.permit(:id, :start_date, :end_date, :fee, :person_num, :room_id, :post_user_id, :reserve_user_id)
  end
  
  def reserve_params_require
    params.require(:reserve).permit(:id, :start_date, :end_date, :fee, :person_num, :room_id, :post_user_id, :reserve_user_id)
  end
  
  def set_reserve
    @reserve = Reserve.find(params[:id])
  end
end
