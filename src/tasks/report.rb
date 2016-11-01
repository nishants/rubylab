module RubyLab
  class Report

    attr_accessor :name, :scenarios
    def initialize name
      @name       = name
      @scenarios  = []
      @error      = nil
    end

    def expect(name, actual, expected)
      @scenarios.push({
        :name     => name,
        :success  => actual == expected,
        :actual   => actual.nil? ? 'nil' : actual ,
        :expected => expected
      })
    end

    def error(exception)
      @error = exception.message.split("for #")[0]
      report
    end

    def report
      {:name => @name, :scenarios => @scenarios, :error => @error}
    end
  end
end