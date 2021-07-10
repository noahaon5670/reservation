class ReservationsController < ApplicationController
  def confilm
    puts "hoge"
    
    @reserve = Reserve.new(params.permit(:id, :start_date))
    if @reserve.invalid?
      render room_path 
    else
    end
  end
  
  def index
  end
  
  def show
    @reserve = Reserve.find(params[:id])
  end
  
  def create
    @reserve = Reserve.new(reserve_params)
    if @reserve.save
      puts "hoge"
      redirect_to reservation_path(@reserve)
    else
      puts "fuga"
    end
  end
  
  private
  
  def reserve_params
    params.require(:reserve).permit(:id, :room_name, :start_date, :end_date, :fee, :room_id, :post_user_id, :reserve_user_id)
  end
end
