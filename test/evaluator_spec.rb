require './src/tasks/evaluator'
require 'rspec'

RSpec.describe RubyLab::Evaluator do

  describe "Should generate report" do

    before :each do
      @evaluator= RubyLab::Evaluator.new("my-test-report")
    end

    it "should convert relative path to failed contract name" do
      expected = {:name => "my-test-report",:scenarios => []}
      expect(@evaluator.report).to eq(expected)
    end

    it "should generate report for success scenario" do
      scenario_name   = "scenario-one"
      actual_value    = "dogs"
      expected_value  = "cats"

      expected_report = {:name => "my-test-report",:scenarios => [
          {:name      => scenario_name,
           :success   => false,
           :actual    => actual_value,
           :expected  => expected_value
          }
      ]}

      @evaluator.verify_scenario(scenario_name, actual_value, expected_value)
      expect(@evaluator.report).to eq(expected_report)
    end

    it "should generate report for failed scenario" do
      scenario_name   = "scenario-one"
      actual_value    = "cats"
      expected_value  = "cats"

      expected_report = {:name => "my-test-report",:scenarios => [
          {:name      => scenario_name,
           :success   => true,
           :actual    => actual_value,
           :expected  => expected_value
          }
      ]}

      @evaluator.verify_scenario(scenario_name, actual_value, expected_value)
      expect(@evaluator.report).to eq(expected_report)
    end

  end

end