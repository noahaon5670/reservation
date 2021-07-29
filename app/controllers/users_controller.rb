class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, only: [:account, :profile, :update_profile]
  
  def account
  end

  def profile
  end
  
  def update_profile
    if @user.update(params.require(:user).permit(:icon, :name, :profile))
      redirect_to "/"
    else
      render "users/profile"
    end
  end
  
  private
  
  def set_current_user
    @user = User.find(current_user.id)
  end
end
