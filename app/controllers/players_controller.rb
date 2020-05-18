class PlayersController < ApplicationController

  before_action :if_not_admin

  def new 
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to teams_path, notice: '選手を登録しました!'
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to teams_path, notice: '選手を更新しました!'
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to teams_path
  end

  private
  def player_params
    params.require(:player).permit(:name, :position, :uniform_number, :footed, :birthday, :height, :weight, :nationally, :team_id)
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin
  end

end
