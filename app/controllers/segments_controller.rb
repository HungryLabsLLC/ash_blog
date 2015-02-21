class SegmentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @segment = @post.segments.new
  end

  def show
  end

  def create
    @post = Post.find(params[:post_id])
    @segment = @post.segments.create(segment_params)
    if @segment
      redirect_to post_path(@post)
    else
      redirect_to new_segment_path(@post)
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @segment = Segment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @segment = Segment.find(params[:id])
    @segment.update_attributes(segment_params)
    redirect_to edit_post_path(@post)
  end

  def destroy
  end

  private

  def segment_params
    params.require(:segment).permit(:content)
  end
end
