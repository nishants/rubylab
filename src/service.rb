require_relative './tasks/report'

module RubyLab
  class Service

  	def initialize config_path
			@tasks_path = "#{config_path}/tasks"
		end

	# __solution_string is avilable for scope of evalutaor.rb
	def eval_solution task_id, __solution_string
		__validator_file = "#{@tasks_path}/#{task_id}/evaluator.rb"
		begin
	 		__proc = Proc.new {}
	 		result = eval(File.read(__validator_file), __proc.binding)
			result[:error] = result[:error].nil? ? nil : result[:error].sub(__FILE__, "")
	 		return result
		rescue Exception => se
			return se.message.sub("(eval)", "Validator file")
		end
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