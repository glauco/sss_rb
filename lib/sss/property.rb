#
# property.rb
#
#   Copyright (c) 2014 Glauco Vinicius <gl4uc0@gmail.com>
#
#   This program is free software.
#   You can distribute/modify this program under the terms of
#   the GNU Lesser General Public License version 2 or later.
#

module SSS
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

    def to_css(parent_context = nil)
      return "" if !name && !values

      "#{@name}: #{@values.join(' ')};" if name && values
    end
  end
end
