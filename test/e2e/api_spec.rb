require './src/tasks/report'
require 'rspec'

require "./test/support/support"
require "./test/support/client"

RSpec.describe RubyLab::Report do

  describe "Should generate report" do

    before :each do
      @client = RubyLab::Client.new("http://localhost:4567")
      @helper = RubyLab::TestSupport.new
    end

    it "should evaluate a script" do
      actual = JSON.parse(@client.put("/evaluate", "'1,2,3'.split(',')"))
      expected = {"result" => ["1","2","3"]}
      expect(actual).to eq(expected)
    end

    it "should generate reports for tasks" do
      submission  = @helper.submission_for("exercise-one")
      expected    = @helper.expected_for("exercise-one")
      actual      = JSON.parse(@client.put("/tasks/exercise-one/evaluate", submission, {'Content-Type' => "application/json"}))
      expect(actual).to eq(expected)
    end

  end

end