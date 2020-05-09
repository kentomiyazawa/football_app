class PlayersController < ApplicationController
  def new 
    @player = Player.new
  end

  def create
    @player = player.create(player_params)
    redirect_to root_path
  end

  private
  def player_params
    params.require(:player).permit(:name, :position, :uniform_number, :footed, :age, :height, :weight, :nationally)
  end
end
