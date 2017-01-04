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

    def __execute
      begin
        __proc = Proc.new {}
        eval(@script.code, __proc.binding, @script.name, 1)
      rescue Exception => se
        return [se.message]
      end
      @report
    end

  end
end
