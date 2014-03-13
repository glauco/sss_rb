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
 
    def to_css(context = nil)
      return "" if !name && !values

      values_css = @values.map do |value|
        value.to_css(context)
      end

      "#{@name}: #{values_css.join(' ')};"
    end
  end
end
