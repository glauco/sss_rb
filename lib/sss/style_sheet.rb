#
# style_sheet.rb
#
#   Copyright (c) 2014 Glauco Vinicius <gl4uc0@gmail.com>
#
#   This program is free software.
#   You can distribute/modify this program under the terms of
#   the GNU Lesser General Public License version 2 or later.
#

module SSS
  class StyleSheet
    attr_reader :rules

    def initialize(rules)
      @rules = rules
    end

    def ==(other)
      @rules == other.rules
    end

    def to_css
      @rules.map do |rule|
        rule.to_css
      end.join
    end
  end
end
