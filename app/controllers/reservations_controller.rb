class ReservationsController < ApplicationController
  def confilm    
    @reserve = Reserve.new(reserve_params_no_require)
    if @reserve.invalid?
    else
    end
  end
  
  def index
    @reserves = Reserve.all
  end
  
  def show
    @reserve = Reserve.find(params[:id])
  end
  
  def create
    @reserve = Reserve.new(reserve_params_require)
    if @reserve.save
      puts "hoge"
      redirect_to reservation_path(@reserve)
    else
      puts "fuga"
    end
  end
  
  private
  
  def reserve_params_no_require
    params.permit(:id, :room_name, :start_date, :end_date, :fee, :person_num, :room_id, :post_user_id, :reserve_user_id)
  end
  
  def reserve_params_require
    params.require(:reserve).permit(:id, :room_name, :start_date, :end_date, :fee, :person_num, :room_id, :post_user_id, :reserve_user_id)
  end
end
