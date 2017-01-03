module RubyLab
  class Assertion
    def initialize(actual, report)
      @actual = actual
      @report = report
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
      success = (@actual == expected)
      result = success ? "success" : "failed"
      unless success
        @report.push(result)
      end
      result
    end
  end
end
