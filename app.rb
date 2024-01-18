require "rubygems"
require "bundler/setup"
Bundler.require :default

enable :sessions

get "/" do
  @name = session[:name]

  if @name
    @title = "Welcome #@name"
    erb :welcome
  else
    @title = "Hello"
    erb :index
  end
end