class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @comment = Comment.new
    @comments = @team.comments.includes(:user)
    @user = User.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.save
    redirect_to teams_path(@team)
  end

  def edit
    @team = Team.find(params[:id])
  end


  private
  def team_params
    params.require(:team).permit(:name, :home, :stadium, :founding_year, :image)
  end

end
