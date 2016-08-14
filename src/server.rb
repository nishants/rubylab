require 'sinatra'
require 'sinatra/cross_origin'

require_relative 'service'

CONFIG_PATH = "config"
service = RubyLab::Service.new CONFIG_PATH
set :allow_origin, :any
set :allow_methods,:any
set :allow_credentials, true
set :max_age, "1728000"
set :expose_headers, ['Content-Type']

options "*" do
  response.headers["Allow"] = "HEAD,GET,PUT,DELETE,OPTIONS"

  # Needed for AngularJS
  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"

  halt HTTP_STATUS_OK
end

put '/task/:task_id/evaluate' do
  solution_string = request.body.read;
  service.eval_solution(params[:task_id], solution_string)
end

get '/task/:task_id/worksheet' do
  service.worksheet_of(params[:task_id])
end
