class BlogsController < ApplicationController

	before_action :redirect_to_index, :except => [:index]

  def index
    @blogs = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments.includes(:user)
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(image: blog_params[:image], title: blog_params[:title], text: blog_params[:text], user_id: current_user.id)
  end

  def destroy
    blog = Blog.find(id_params[:id])
    blog.destroy if blog.user_id == current_user.id
  end

  def edit
    @blog = Blog.find(id_params[:id])
  end

  def update
    blog = Blog.find(id_params[:id])
    blog.update(blog_params) if blog.user_id == current_user.id
  end

  private
  def blog_params
    params.require(:blog).permit(:image, :text, :title)
  end

  def id_params
    params.permit(:id)
  end

  def redirect_to_index
    redirect_to :action => "index" unless user_signed_in?
  end
end