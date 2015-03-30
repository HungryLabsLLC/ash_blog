class MainController < ApplicationController

  def index
    @post = Post.where(published: true).last
  end
  
end