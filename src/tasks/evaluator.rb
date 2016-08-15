module RubyLab
  class Evaluator

    attr_accessor :name, :scenarios
    def initialize name
      @name       = name
      @scenarios  = []
      @error      = nil
    end

    def verify_scenario(name, actual, expected)
      @scenarios.push({
        :name     => name,
        :success  => actual == expected,
        :actual   => actual.nil? ? 'nil' : actual ,
        :expected => expected
      })
    end

    def error(exception)
      @error = exception.message.include?("for #") ? exception.message.split("for #")[1] : exception.message;
      report
    end

    def report
      {:name => @name, :scenarios => @scenarios, :error => @error}
    end
  end
end