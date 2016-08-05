class PostsController < ApplicationController
  before_action :authenticate_user!

  def show

  end

  def new
    @post = Post.new
    # @post[:created_by] = 'current_member[:email]'
  end

  def create
    #current_user.posts.build()
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
    #traer del cookie los ids que ya vi
    @posts = Post.where("end_time >= ?", Time.now).where.not(id: [])
  end

  private

  def post_params
    params.require(:post).permit(:message, :start_time, :end_time, :created_by)
  end
end
