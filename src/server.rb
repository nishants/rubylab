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

put '/task/:task_id/evaluate' do
  solution_string = request.body.read;
  service.eval_solution(params[:task_id], solution_string)
end

get '/task/:task_id/worksheet' do
  service.worksheet_of(params[:task_id])
end
