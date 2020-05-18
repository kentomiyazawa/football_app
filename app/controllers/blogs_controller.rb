class BlogsController < ApplicationController

  def index
    @blogs = Blog.all.includes(:user)
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
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to user_path(@blog.user), notice: "ブログの投稿に成功しました！"
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
    redirect_to blog_path(@blog.user), notice: "ブログが更新されました!"
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
