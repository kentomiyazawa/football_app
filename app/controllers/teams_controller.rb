class TeamsController < ApplicationController

  before_action :if_not_admin, except: [:index, :show, :chat]

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.players.order(uniform_number: :ASC)
    @maneger = @team.maneger
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)
    redirect_to teams_path(@team)
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to root_path
  end

  def chat
    @team = Team.find(params[:id])
    @comment = Comment.new
    @comments = @team.comments.includes(:user)
    @players = @team.players
  end

  private
  def team_params
    params.require(:team).permit(:name, :home, :stadium, :founding_year, :image)
  end


  def if_not_admin
    redirect_to root_path unless current_user.admin
  end

end
