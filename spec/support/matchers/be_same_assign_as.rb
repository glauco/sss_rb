require 'rspec/expectations'

RSpec::Matchers.define :be_same_assign_as do |expected|
  match do |actual|
    actual.name.should == expected.name
    actual.values.should be_same_literals_as expected.values
  end
end
