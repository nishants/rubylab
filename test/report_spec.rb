require './src/tasks/report'
require 'rspec'

RSpec.describe RubyLab::Report do

  describe "Should generate report" do

    before :each do
      @evaluator= RubyLab::Report.new("my-test-report")
    end

    it "should convert relative path to failed contract name" do
      expected = {:name => "my-test-report",:scenarios => [], :error=>nil}
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
      ], :error=>nil}

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
      ], :error=>nil}

      @evaluator.verify_scenario(scenario_name, actual_value, expected_value)
      expect(@evaluator.report).to eq(expected_report)
    end

    it "should replace nil by 'nil' string" do
      scenario_name   = "scenario-one"
      actual_value    = nil
      expected_value  = "cats"

      expected_report = {:name => "my-test-report",:scenarios => [
          {:name      => scenario_name,
           :success   => false,
           :actual    => "nil",
           :expected  => expected_value
          }
      ], :error=>nil}

      @evaluator.verify_scenario(scenario_name, actual_value, expected_value)
      expect(@evaluator.report).to eq(expected_report)
    end

  end

end