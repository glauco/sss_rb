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
    attr_accessor :rule, :parent

    def initialize(rule, parent = nil)
      @rule = rule
      @parent = parent
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
  end
end
