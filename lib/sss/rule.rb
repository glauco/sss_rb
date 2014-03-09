class Rule
  attr_reader :selector, :properties

  def initialize(selector, properties)
    @selector = selector
    @properties = properties
  end

  def ==(other)
    @selector == other.selector &&
      @properties == other.properties
  end

  def to_s
    "selector: #{@selector} properties: #{@properties}"
  end

  def to_css
    properties_css = @properties.map do |property|
      property.to_css()
    end.join(' ')

    "#{@selector} { #{properties_css} }"
  end
end
