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
	 		return result
		rescue SyntaxError => se
			return se.message.sub("(eval)", "Validator file")
		end
	end

  end
end



# clear
# validator_file = "C:/Users/dawn/Documents/xplab/exercise-one/validator.rb"
# solution_file  = "C:/Users/dawn/Documents/xplab/exercise-one/solution_string.txt"

# solution_report = eval_solution(validator_file, solution_file)
# solution_report
# puts solution_report

