module SSS
  class Variable
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def to_css(context)
      context.get(@name)
    end
  end
end
