Rails.application.routes.draw do

  resources :categories
  devise_for :users
  resources :articles do
    resources :comments, only: [:create, :destroy, :update, :show]
  end

=begin
  get "/articles" index
  post "/articles" create
  delete "/articles/:id" destroy
  get "/articles/:id" show
  get "/articles/new" new
  get "/aticles/:id/edit" edit
  patch "/articles/:id" update
  put "/articles/:id" update
=end
  root 'articles#index'

  get "/dashboard", to: "welcome#dashboard"

  put "/articles/:id/publish", to: "articles#publish"

end
