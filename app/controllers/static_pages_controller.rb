class StaticPagesController < ApplicationController

  def home
    if current_user
      redirect_to posts_index_path
    end
  end
end
