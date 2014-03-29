#
# sss.rb
#
#   Copyright (c) 2014 Glauco Vinicius <gl4uc0@gmail.com>
#
#   This program is free software.
#   You can distribute/modify this program under the terms of
#   the GNU Lesser General Public License version 2 or later.
#

 $:.unshift(File.dirname(__FILE__) + '/sss')

require "context"
require 'parser.tab'
require 'property'
require 'rule'
require 'style_sheet'
require 'version'

module SSS
end
