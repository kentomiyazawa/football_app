class Api::CommentsController < ApplicationController
  def index
    team = Team.find(params[:team_id]) 
    last_comment_id = params[:id].to_i
    @comments = team.comments.includes(:user).where("id > ?", last_comment_id)
  end
end
