require "sinatra"
require "sinatra/reloader" if development?
require "slim"
require_relative "database"

# get "/" do
#   @database = DB
# end

get '/' do
  slim :index
end
