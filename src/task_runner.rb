require_relative 'assertion'

module RubyLab
  class TaskRunner

    def initialize(task_id, task_validator_file)
      @task_validator_file = task_validator_file
      @task_id = task_id
      @report = RubyLab::Report.new(task_id)
    end

    def report
      @report
    end

    def submission
      @solution_string
    end

    def __validator_file
      @task_validator_file
    end

    def evaluate_solution solution_string
      @solution_string = solution_string
      begin
        __proc = Proc.new {}
        result = eval(File.read(__validator_file), __proc.binding)
        result[:error] = result[:error].nil? ? nil : result[:error].sub(__FILE__, "")
        return result
      rescue Exception => se
        return se.message.gsub(__FILE__, "")
      end
    end

  end
end
