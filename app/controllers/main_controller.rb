class MainController < ApplicationController

  def index
    @posts = Post.ordered_published_posts
  end
  
end