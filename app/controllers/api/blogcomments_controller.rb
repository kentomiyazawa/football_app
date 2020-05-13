class Api::BlogcommentsController < ApplicationController
  def index
    blog = Blog.find(params[:blog_id])
    last_blogcomment_id = params[:id].to_i
    @blogcomments = blog.blogcomments.includes(:user).where("id > ?", last_blogcomment_id)
  end
end
