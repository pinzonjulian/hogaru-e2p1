class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    # @post[:created_by] = 'current_member[:email]'
  end

  def create
    #current_user.posts.build()
    @post = Post.new(post_params)
    @post[:created_by] = current_user.email
    @post[:start_time] = params[:start_time] || DateTime.now
    if @post.save
      flash[:success] = "Your message has been posted!"
      redirect_to posts_path
    else
      flash.now[:warning] = "There's been an error with your message"
      render 'new'
    end
  end

  def index
    # mark_as_seen()# Agregar posts a los que le haga click
    #traer del cookie los ids que ya vi
    @posts = Post.where("end_time >= ?", Time.now).where.not(id: cookies.signed[:hidden_posts])
  end

  def hide
    # si ya tengo [1, 2, 3]

    # Buscar el id del post
    already_hidden = cookies.signed[:hidden_posts] || []
    post_to_hide = params[:id]
    # hacerle push al array de sessions
    cookies.permanent.signed[:hidden_posts] = already_hidden.push(post_to_hide)
    # session[:hidden_posts] = already_hidden.push(post_to_hide)
    # redirigir a index
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message, :start_time, :end_time, :created_by)
  end
end
