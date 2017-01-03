require 'sinatra'
require 'json'

require_relative 'service'

CONFIG_PATH = "config"
service = RubyLab::Service.new CONFIG_PATH
before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST','PUT'],
          'Access-Control-Allow-Headers' => ['Content-Type', "x-requested-with", "origin"]
end
set :protection, false

options '/*' do
  response["Access-Control-Allow-Headers"] = "origin, x-requested-with, content-type"
end

put '/tasks/:task_id/evaluate' do
  solution_string = request.body.read
  service.eval_solution(params[:task_id], solution_string).to_json
end

get '/tasks/:task_id' do
  service.worksheet_of(params[:task_id]).to_json
end

put '/evaluate' do
  expression = request.body.read;
  service.evaluate(expression).to_json
end

put '/validate' do
  submission = JSON.parse(request.body.read);
  worksheet  = submission["worksheet"]
  validator  = submission["validator"]
  service.validate(worksheet, validator).to_json
end
