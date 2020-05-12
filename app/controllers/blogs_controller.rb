class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
    @search = Blog.ransack(params[:q])
    @results = @search.result(distinct: true)
  end

  def show
    @blog = Blog.find(params[:id])
    @blogcomment = Blogcomment.new
    @blogcomments = @blog.blogcomments.includes(:user)
    @likes_count = Like.where(blog_id: @blog.id).count
  end

  def new
    @blog = Blog.new 
  end

  def create
    @blog = Blog.create(blog_params)
    redirect_to user_path(@blog.user)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to blog_path(@blog.user)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text).merge(user_id: current_user.id)
  end
end
