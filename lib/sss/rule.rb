#
# rule.rb
#
#   Copyright (c) 2014 Glauco Vinicius <gl4uc0@gmail.com>
#
#   This program is free software.
#   You can distribute/modify this program under the terms of
#   the GNU Lesser General Public License version 2 or later.
#

require 'sss/context.rb'

module SSS
  class Rule
    attr_reader :selector, :declarations

    def initialize(selector, declarations)
      @selector = selector
      @declarations = declarations
    end

    def ==(other)
      properties = @declarations.select { |d| d.is_a?(Property) }
      rules = @declarations.select { |d| d.is_a?(Rule) }

      other_properties = other.declarations.select { |d| d.is_a?(Property) }
      other_rules = other.declarations.select { |d| d.is_a?(Rule) }

      @selector == other.selector &&
        properties == other_properties &&
        rules == other_rules
    end

    def to_css(parent_context = nil)
      context = Context.new(self, parent_context)

      properties = @declarations.select { |d| d.is_a?(Property) }
      rules = @declarations.select { |d| d.is_a?(Rule) }

      properties_css = properties.map { |p| p.to_css(context) }
      nested_rules_css = rules.map { |r| r.to_css(context) }

      ["#{context.selector} { #{properties_css.join(' ')} }"]
        .push(nested_rules_css).join("\n")
    end
  end
end
