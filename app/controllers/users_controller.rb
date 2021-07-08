class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def account
    @users = User.all
  end

  def profile
    @user = User.find(current_user.id)
  end
  
  def update_profile
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:icon, :name, :profile))
      redirect_to "/"
    else
      render "users/profile"
    end
  end
end
