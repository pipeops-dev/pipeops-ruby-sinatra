require 'sinatra'

# Allow all hosts (necessary for Docker and dynamic hosting environments)
set :protection, except: [:host_authorization]

get '/' do
  'Welcome to Pipeops Ruby on Sinatra App!'
end
