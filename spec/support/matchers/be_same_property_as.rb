require 'rspec/expectations'

RSpec::Matchers.define :be_same_property_as do |expected|
  match do |actual|
    if actual.is_a?(Array)
      actual.zip(expected).each do |actual_property, expected_property|
        actual_property.should be_same_property_as expected_property
      end
    else
      actual.name.should == expected.name
      actual.values.should == expected.values
    end
  end
end
