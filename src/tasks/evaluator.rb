module RubyLab
  class Evaluator

    attr_accessor :name, :scenarios
    def initialize name
      @name       = name
      @scenarios  = []
    end

    def verify_scenario(name, result, expected)
      @scenarios.push({
        :name     => name,
        :success  => result == expected,
        :actual   => result,
        :expected => expected
      })
    end

    def report
      {:name => @name, :scenarios => @scenarios}
    end
  end
end