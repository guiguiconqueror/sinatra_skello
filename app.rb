require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"

# get "/" do
#   @database = DB
# end

get '/' do
  'Hello World !'
end
