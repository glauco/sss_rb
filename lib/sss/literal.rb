module SSS
  class Literal
    attr_accessor :value

    def initialize(value)
      @value = value
    end

    def to_css(context)
      @value
    end
  end
end
