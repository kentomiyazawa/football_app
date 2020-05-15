class ManegersController < ApplicationController

  before_action :if_not_admin

  def new
    @maneger = Maneger.new
  end

  def create
    @maneger = Maneger.create(maneger_params)
    redirect_to root_path, notice: '監督を登録しました!'
  end

  def edit
    @maneger = Maneger.find(params[:id])
  end

  def update
    @maneger = Maneger.find(params[:id])
    @maneger.update(maneger_params)
    redirect_to root_path, notice: '監督を更新しました!'
  end

  def destroy
    @maneger = Maneger.find(params[:id])
    @maneger.destroy
    redirect_to new_maneger_path
  end

  private 
  def maneger_params
    params.require(:maneger).permit(:name, :birthday, :nationally, :team_id)
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin
  end
end
