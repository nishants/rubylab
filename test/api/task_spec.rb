require './src/tasks/report'
require 'rspec'

require "./test/support/support"
require "./test/support/client"

RSpec.describe RubyLab::Report do

  describe "Should generate report" do

    before :each do
      @evaluator= RubyLab::Report.new("my-test-report")
    end

    it "should convert relative path to failed contract name" do
      expected = {:name => "my-test-report",:scenarios => [], :error => nil}
      expect(@evaluator.report).to eq(expected)
    end

  end

end