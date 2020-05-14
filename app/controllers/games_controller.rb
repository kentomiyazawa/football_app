class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    redirect_to matches_path, notice: '試合を登録しました!'
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to matches_path
  end
  
  private
  def game_params
    params.require(:game).permit(:match_id, :home_team_id, :away_team_id, :start_time)
  end
end
