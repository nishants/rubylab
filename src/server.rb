require 'sinatra'
require_relative 'service'

CONFIG_PATH = "config"
service = RubyLab::Service.new CONFIG_PATH

put '/task/:task_id/evaluate' do
  solution_string = request.body.read;
  service.eval_solution(params[:task_id], solution_string)
end