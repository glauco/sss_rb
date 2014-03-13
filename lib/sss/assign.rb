module SSS
  class Assign
    attr_accessor :name, :values

    def initialize(name, values)
      @name = name
      @values = values
    end 

    def to_css(context)
      values_css = @values.map do |value|
        value.to_css(context)
      end

      context.set(@name, values_css.join(' '))
      nil
    end
  end
end
