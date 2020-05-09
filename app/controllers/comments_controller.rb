class CommentsController < ApplicationController
  
  def create
    @comment = Comment.create(comment_params)
    redirect_to "/teams/#{@comment.team.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, team_id: params[:team_id])
  end
end
