class PostsController < ApplicationController
  before_action :authenticate_user!

  def show

  end

  def new
    @post = Post.new
    # @post[:created_by] = 'current_member[:email]'
  end

  def create
    @post = Post.new(post_params)
    @post[:created_by] = current_user.email
    @post[:start_time] = DateTime.now
    if @post.save
      flash.now[:success] = "Your message has been posted!"
      redirect_to posts_index_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.where("end_time >= ?", Time.now)
  end

  private

  def post_params
    params.require(:post).permit(:message, :start_time, :end_time, :created_by)
  end
end
