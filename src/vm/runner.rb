module RubyLab
  class Runner

    def initialize(script)
      @script = script
      @report = []
    end

    def expect actual
      RubyLab::Assertion.new(actual, @report, @test_name)
    end

    def equal(expected)
      expected
    end
    def eq(expected)
      expected
    end

    def it(name)
      @test_name = name;
    end

    def __execute
      begin
        __proc = Proc.new {}
        eval(@script.code, __proc.binding, @script.name, 1)
      rescue Exception => se
        return [se.message]
      end
      {:tests => @report}
    end

  end
end
"{\"tests\":[{\"name\":\"comapres cars\",\"success\":true,\"expected\":\"Junajo\",\"acutal\":\"Junajo\"}]}"