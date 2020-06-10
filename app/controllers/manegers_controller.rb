class ManegersController < ApplicationController

  before_action :if_not_admin

  def new
    @maneger = Maneger.new
  end

  def create
    @maneger = Maneger.new(maneger_params)
    if @maneger.save
      redirect_to teams_path, notice: '監督を登録しました!'
    else
      render :new
    end
  end

  def edit
    @maneger = Maneger.find(params[:id])
  end

  def update
    @maneger = Maneger.find(params[:id])
    if @maneger.update(maneger_params)
      redirect_to root_path, notice: '監督を更新しました!'
    else
      render :edit
    end
  end

  def destroy
    @maneger = Maneger.find(params[:id])
    @maneger.destroy
    redirect_to teams_path
  end

  private 
  def maneger_params
    params.require(:maneger).permit(:name, :birthday, :nationally, :team_id)
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin
  end
end
