require_relative './tasks/report'
require_relative './task_runner'

module RubyLab
  class Service

  	def initialize config_path
			@tasks_path = "#{config_path}/tasks"
		end

	# __solution_string is avilable for scope of evalutaor.rb
	def eval_solution task_id, __solution_string
    RubyLab::TaskRunner.new(task_id, "#{@tasks_path}/#{task_id}/evaluator.rb").evaluate_solution(__solution_string)
	end

		def worksheet_of(task_id)
			{:worksheet => File.read("#{@tasks_path}/#{task_id}/worksheet.txt"),
       :replScope => File.read("#{@tasks_path}/#{task_id}/repl-scope.rb")}
		end

    def evaluate(expression)
      begin
        result = eval(expression)
        return {"result" => result}
      rescue Exception => se
        return {"error" => se.message.split("for #")[0]}
      end
    end

	end
end