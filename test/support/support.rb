require './src/server'

module RubyLab
  class TestSupport

    def submission_for(task_id)
      File.read("./test/data/tasks/#{task_id}/submission.rb")
    end

    def expected_for(task_id)
      JSON.parse(File.read("./test/data/tasks/#{task_id}/expected.json"))
    end
  end
end