module RubyLab
  class Service
  	def initialize config_path
  	end

	def eval_solution __validator_file, __solution_file
		begin
	 		__proc = Proc.new {}
	 		result = eval(File.read(__validator_file), __proc.binding)
	 		return result
		rescue SyntaxError => se
			return se.message.sub("(eval)", "Validator file")
		end
	end
  
	def solution_as_file solution_string
		file = Tempfile.new('foo')
		file.write(solution_string)
		file.close
		file.path
	end
  end
end



# clear
# validator_file = "C:/Users/dawn/Documents/xplab/exercise-one/validator.rb"
# solution_file  = "C:/Users/dawn/Documents/xplab/exercise-one/solution_string.txt"

# solution_report = eval_solution(validator_file, solution_file)
# solution_report
# puts solution_report

