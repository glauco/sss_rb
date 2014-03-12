require 'rspec/expectations'
require 'sss/property'
require 'sss/rule'

RSpec::Matchers.define :be_same_rules_as do |expected|
  match do |actual|
    actual.zip(expected).each do |actual_declaration, expected_declaration|
      if actual_declaration.is_a?(Array)
        actual_declaration.should be_same_rules_as expected_declaration
      end

      if actual_declaration.is_a?(SSS::Property)
        actual_declaration.should be_same_property_as expected_declaration
      end

      if actual_declaration.is_a?(SSS::Rule)
        actual_declaration.should be_same_rule_as expected_declaration
      end
    end
  end
end
