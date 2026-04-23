require 'sinatra'

# Disable all Rack protections to ensure host headers don't cause blocks in Docker/dynamic environments
disable :protection
set :host_authorization, { permitted_hosts: [] }

get '/' do
  'Welcome to Pipeops Ruby on Sinatra App!'
end
