class TeamsController < ApplicationController

  before_action :if_not_admin, except: [:index, :show, :chat]

  def index
    @teams = Team.all.order(name: :ASC)
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
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path(@team), notice: 'チームを登録しました！'
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to root_path, notice: 'チームを更新しました！'
    else
      render :edit
    end
  end

  def chat
    @team = Team.find(params[:id])
    @comment = Comment.new
    @comments = @team.comments.includes(:user)
    @players = @team.players.order(uniform_number: :ASC)
  end

  private
  def team_params
    params.require(:team).permit(:name, :home, :stadium, :founding_year, :image)
  end


  def if_not_admin
    redirect_to root_path unless current_user.admin
  end

end
