require 'sinatra'

# # require_relative 'file_helper'
require_relative 'service'

CONFIG_PATH = "config/"
service = RubyLab::Service.new CONFIG_PATH
# set :port, 3000

put '/task/:task_name/evaluate' do
  solution_string = request.body.read;
end


require 'sinatra'

get '/' do
  "Hello, world"
end