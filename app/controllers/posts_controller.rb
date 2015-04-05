class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :like]

  def index
    @posts = Post.all
    if params[:publish].present?
      post = Post.find(params[:publish])
      post.published = true
      post.published_date = Date.today
      post.save
    elsif params[:unpublish].present?
      post = Post.find(params[:unpublish])
      post.published = false
      post.published_date = Date.today
      post.save
    end
  end

  def new
    @post = Post.new
  end

  def like
    @post = Post.find(params[:id])
    if @post.likes.create(ip_address: request.remote_ip)
      render 'like'
    else
      render 'like'
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to edit_post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    if @post
      redirect_to posts_path
    else
      redirect_to new_posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:id, :title, :published_date)
  end

end