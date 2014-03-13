#
# context.rb
#
#   Copyright (c) 2014 Glauco Vinicius <gl4uc0@gmail.com>
#
#   This program is free software.
#   You can distribute/modify this program under the terms of
#   the GNU Lesser General Public License version 2 or later.
#

module SSS
  class Context
    attr_accessor :rule, :parent, :variables

    def initialize(rule = nil, parent = nil)
      @rule = rule
      @parent = parent
      @variables = {}
    end

    def selector
      selectors.join(' ')
    end

    def selectors
      selectors = []
      selectors = @parent.selectors if @parent
      selectors.push(@rule.selector) if @rule

      selectors
    end

    def set(name, value)
      @variables[name] = value
    end

    def get(name)
      return @variables[name] if @variables.has_key?(name)
      return @parent.get(name) if @parent

      raise "undeclared variable #{name}"
    end
  end
end
