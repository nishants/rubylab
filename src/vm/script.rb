
module RubyLab
  class Script
    attr_accessor :name, :code

    def initialize(name, code)
      @code = code;
      @name = name;
    end
  end

end