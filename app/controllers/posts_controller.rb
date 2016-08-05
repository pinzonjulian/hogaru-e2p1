class PostsController < ApplicationController

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash.now[:success] = "Your message has been posted!"
      redirect_to posts_index_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message, :start_time, :end_time)
  end
end
