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

    def to_css(parent_context = nil)
      return "" if !@selector && !@declarations

      properties_css = []
      nested_rules_css = []
      context = Context.new(self, parent_context)

      @declarations.each do |d|
        css = d.to_css(context)

        if d.is_a?(SSS::Property)
          properties_css.push(css)
        elsif d.is_a?(SSS::Rule)
          nested_rules_css.push(css)
        end
      end

      ["#{context.selector} { #{properties_css.join(' ')} }"]
        .push(nested_rules_css)
        .join("\n")
    end
  end
end
