require 'rspec/expectations'
require 'sss/property'
require 'sss/rule'

RSpec::Matchers.define :be_same_rule_as do |expected|
  match do |actual|
    if actual.is_a?(SSS::Property)
      actual.should be_same_property_as expected
    elsif actual.is_a?(SSS::Rule)
      actual_properties = actual.declarations.select { |d| d.is_a?(SSS::Property) }
      actual_rules = actual.declarations.select { |d| d.is_a?(SSS::Rule) }

      expected_properties = expected.declarations.select { |d| d.is_a?(SSS::Property) }
      expected_rules = expected.declarations.select { |d| d.is_a?(SSS::Rule) }

      actual.selector.should == expected.selector
      actual_properties.should be_same_property_as expected_properties
      actual_rules.should be_same_statements_as expected_rules
    end
  end
end
