module RubyLab
  class Assertion
    def initialize(actual, report)
      @actual = actual
      @report = report
    end

    def not_to(expected)
      actual = @actual
      result = LookLike::Matchers.match(actual, expected) ? LookLike::Matchers.negate_error(actual, expected) : nil
      unless result.nil?
        @report.push(result)
      end
      result
    end

    def to(expected)
      actual = @actual
      result = LookLike::Matchers.match(actual, expected) ? nil : LookLike::Matchers.error(actual, expected)
      unless result.nil?
        @report.push(result)
      end
      result
    end
  end
end
