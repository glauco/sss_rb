require 'rspec/expectations'
require 'sss/property'

RSpec::Matchers.define :be_same_property_as do |expected|
  match do |actual|
    if actual.is_a?(Array)
      actual.zip(expected).each do |_actual, _expected|
        _actual.should be_same_property_as _expected
      end
    elsif actual.is_a?(SSS::Property)
      actual.name.should == expected.name

      actual_literals = actual.values.select { |v| v.is_a?(SSS::Literal) }
      expected_literals = expected.values.select { |v| v.is_a?(SSS::Literal) }

      actual_literals.should be_same_literals_as expected_literals

      actual_variables = actual.values.select { |v| v.is_a?(SSS::Variable) }
      expected_variables = expected.values.select { |v| v.is_a?(SSS::Variable) }

      actual_variables.should be_same_variables_as expected_variables
    end
  end
end
