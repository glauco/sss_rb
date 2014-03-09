class StyleSheet
  attr_reader :rules

  def initialize(rules)
    @rules = rules
  end

  def ==(other)
    @rules == other.rules
  end

  def to_s
    @rules.map do |rule|
      rule.to_s + '\n'
    end
  end

  def to_css
    @rules.map do |rule|
      rule.to_css()
    end.join("\n ")
  end
end 
