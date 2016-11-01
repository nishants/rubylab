require './src/server'

module RubyLab
  class TestSupport

    def submission_for(task_id)
      File.read("./config/tasks/#{task_id}/validation/submission.rb")
    end

    def failing_submission_for(task_id)
      File.read("./config/tasks/#{task_id}/validation/failing_submission.rb")
    end

    def expected_for(task_id)
      JSON.parse(File.read("./config/tasks/#{task_id}/validation/expected.json"))
    end

    def expected_failure_for(task_id)
      JSON.parse(File.read("./config/tasks/#{task_id}/validation/expected_failure.json"))
    end

    def error_submission_for(task_id)
      File.read("./config/tasks/#{task_id}/validation/error_submission.rb")
    end

    def expected_error_for(task_id)
      JSON.parse(File.read("./config/tasks/#{task_id}/validation/expected_error.json"))
    end

  end
end