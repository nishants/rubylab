require './src/tasks/report'
require 'rspec'

require "./test/support/support"
require "./test/support/client"

RSpec.describe RubyLab::Report do

  describe "Api Test" do

    before :each do
      @client = RubyLab::Client.new("http://localhost:4567")
      @helper = RubyLab::TestSupport.new
    end

    it "should validate a workscript, given the validator" do
      spec       = @helper.get_spec("simple_snippet")
      request    = {  "worksheet" => spec["worksheet"],
                      "validator" => spec["validator"]
                   }.to_json
      response   = @client.put("/validate", request)

      expect(JSON.parse(response)).to eq(spec["expect"])
    end
    it "should report failing tests" do
      spec       = @helper.get_spec("simple_failing_snippet")
      request    = {  "worksheet" => spec["worksheet"],
                      "validator" => spec["validator"]
                   }.to_json
      response   = @client.put("/validate", request)

      expect(JSON.parse(response)).to eq(spec["expect"])
    end

    it "should return reports if all tests passed" do
      submission  = @helper.submission_for("exercise-one")
      expected    = @helper.expected_for("exercise-one")
      actual      = JSON.parse(@client.put("/tasks/exercise-one/evaluate", submission, {'Content-Type' => "application/json"}))
      expect(actual).to eq(expected)
    end

    it "should return reports if some tests failed" do
      submission  = @helper.failing_submission_for("exercise-one")
      expected    = @helper.expected_failure_for("exercise-one")

      actual      = JSON.parse(@client.put("/tasks/exercise-one/evaluate", submission, {'Content-Type' => "application/json"}))
      expect(actual).to eq(expected)
    end

    it "should return reports if submission contains error" do
      submission  = @helper.error_submission_for("exercise-one")
      expected    = @helper.expected_error_for("exercise-one")

      actual      = JSON.parse(@client.put("/tasks/exercise-one/evaluate", submission, {'Content-Type' => "application/json"}))
      expect(actual["error"]).to include(expected["error"])
    end

  end

end