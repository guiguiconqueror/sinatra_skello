require "sinatra"
require "sinatra/reloader" if development?
require "slim"

require 'sinatra/activerecord'
require './config/environments'
require './models/models'


get '/' do
  if params[:query].present?
    @posts = Post.includes(:comments).where("title ILIKE ?", "%#{params[:query]}%")
  else
    @posts = Post.includes(:comments).ordered_by_ratings
  end

  slim :index
end

get "/posts/new" do
  @title = "Création d'un post"
  @post = Post.new

  slim :new
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  @title = @post.title
  @comments = @post.comments.order("created_at DESC")

  slim :show
end

post "/posts" do
  @post = Post.new(params[:post])
  if @post.save
    redirect "/"
  else
    slim :new
  end
end

get "/post/:id/delete" do
  @post = Post.find(params[:id]).destroy
  redirect "/"
end

post '/posts/:id/comments' do
  id = params[:id]
  post = Post.find(id)
  comment = Comment.new(params[:comment])
  comment.post = post
  comment.save
  redirect "posts/#{post.id}"
end

get '/posts/:id/likethepost' do
  id = params[:id]
  post = Post.find(id)
  post.likethepost!
  post.save
  redirect "/"
end
