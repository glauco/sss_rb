class Property
  attr_reader :name, :values

  def initialize(name, values)
    @name = name
    @values = values
  end

  def ==(other)
    @name == other.name &&
      @values == other.values
  end

  def to_s
    "name: #{@name} values: #{@values}"
  end

  def to_css
    "#{@name}: #{@values.join(' ')};"
  end
end
