class BlogcommentsController < ApplicationController
  def create
    @blogcomment = Blogcomment.create(blogcomment_params)
    redirect_to "/blogs/#{@blogcomment.blog.id}"
  end

  private
  
  def blogcomment_params
    params.require(:blogcomment).permit(:text).merge(user_id: current_user.id, blog_id: params[:blog_id])
  end
end
