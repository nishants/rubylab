module RubyLab
  class Runner

    def initialize(script)
      @script = script
      @report = []
    end

    def expect actual
      RubyLab::Assertion.new(actual, @report)
    end


    def equal(expected)
      expected
    end

    def execute
      begin
        __proc = Proc.new {}
        eval(@script, __proc.binding)
      rescue Exception => se
        return [se.message]
      end
      @report
    end

  end
end
