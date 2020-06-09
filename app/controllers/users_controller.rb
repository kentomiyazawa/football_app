class UsersController < ApplicationController
  before_action :set_user

  def show
  end

  def edit
    if @user != current_user
      redirect_to root_path
    end
  end

  def update
    if @user.update(user_params) 
      redirect_to user_path(@user)
    else
      render :edit
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
