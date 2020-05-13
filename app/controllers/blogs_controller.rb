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
    if @blog = Blog.create(blog_params)
      redirect_to user_path(@blog.user)
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    if @blog.user != current_user
      redirect_to blogs_path
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
    redirect_to blog_path(@blog.user)
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text).merge(user_id: current_user.id)
  end

end
