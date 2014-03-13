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
   attr_reader :statements

    def initialize(statements)
      @statements = statements
    end

    def to_css
      return "" if !@statements

      context = SSS::Context.new

      @statements
        .map do |statement|
          statement.to_css(context)
        end
        .reject do |statement|
          !statement
        end
        .join
    end
  end
end
