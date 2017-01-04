require './src/server'
require 'yaml'

module RubyLab
  class TestSupport

    def get_spec(name)
      submission = YAML.load(File.read("./specs/#{name}.yml"))
      {  "worksheet" => submission["worksheet"].join("\n"),
         "validator" => submission["validator"].join("\n"),
         "expected"  => submission["expected"]
      }
    end

    def submission_for(task_id)
      File.read("./test/data/submission.rb")
    end

    def failing_submission_for(task_id)
      File.read("./test/data/failing_submission.rb")
    end

    def expected_for(task_id)
      JSON.parse(File.read("./test/data/expected.json"))
    end

    def expected_failure_for(task_id)
      JSON.parse(File.read("./test/data/expected_failure.json"))
    end

    def error_submission_for(task_id)
      File.read("./test/data/error_submission.rb")
    end

    def expected_error_for(task_id)
      JSON.parse(File.read("./test/data/expected_error.json"))
    end

  end
end