Rails.application.routes.draw do
  get 'seen_posts/new'

  root 'static_pages#home'

  # get 'posts/new'
  #
  # post 'posts/create'
  #
  # get 'posts/show'
  #
  # get 'posts/index'
  #

  devise_for :users

  resources :posts do
    member do
      get 'hide'
    end
  end

end
