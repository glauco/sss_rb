require 'rspec/expectations'
require 'sss/variable'

RSpec::Matchers.define :be_same_variable_as do |expected|
  match do |actual|
   actual.name.should == expected.name
  end
end 
