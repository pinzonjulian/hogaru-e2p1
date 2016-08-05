Rails.application.routes.draw do
  root 'static_pages#home'

  get 'posts/new'

  get 'posts/create'
  post 'posts/create'

  get 'posts/show'

  get 'posts/index'

  devise_for :users


end
