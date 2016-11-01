require_relative 'assertion'

module RubyLab
  class Runner

    def self.run(script)
      RubyLab::Runner.new(script).execute
    end

    def initialize(script)
      @script = script
      @report = []
    end

    def expect actual
      RubyLab::Assertion.new(actual, @report)
    end

    def look_like expected
      expected
    end

    def execute
      __validator_file = @script
      begin
        __proc = Proc.new {}
        result = eval(File.read(__validator_file), __proc.binding)
        result[:error] = result[:error].nil? ? nil : result[:error].sub(__FILE__, "")
        return result
      rescue Exception => se
        return [se.message]
      end
      @report
    end

  end
end
