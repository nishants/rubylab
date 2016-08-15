module RubyLab
  class Evaluator

    attr_accessor :name, :scenarios
    def initialize name
      @name       = name
      @scenarios  = []
    end

    def verify_scenario(name, actual, expected)
      @scenarios.push({
        :name     => name,
        :success  => actual == expected,
        :actual   => actual.nil? ? 'nil' : actual ,
        :expected => expected
      })
    end

    def report
      {:name => @name, :scenarios => @scenarios}
    end
  end
end