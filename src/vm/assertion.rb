module RubyLab
  class Assertion
    def initialize(actual, report, test_name)
      @actual = actual
      @report = report
      @test_name = test_name
    end

    def not_to(expected)
      success = (@actual != expected)
      result = success ? "success" : "failed"
      unless success
        @report.push(result)
      end
      result
    end

    def to(expected)
      @report.push({
                       :name     => @test_name,
                       :success  => expected == @actual,
                       :expected => expected,
                       :actual   => @actual,
                   })
    end
  end
end
