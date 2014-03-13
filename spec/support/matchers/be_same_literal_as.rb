require 'rspec/expectations'

RSpec::Matchers.define :be_same_literal_as do |expected|
  match do |actual|
    actual.value.should == expected.value 
  end
end
