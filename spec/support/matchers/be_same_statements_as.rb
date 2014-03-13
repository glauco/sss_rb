require 'rspec/expectations'
require 'sss/property'
require 'sss/rule'

RSpec::Matchers.define :be_same_statements_as do |expected|
  match do |actual|
    actual.zip(expected).each do |_actual, _expected|
      if _actual.is_a?(Array)
        _actual.should be_same_statements_as _expected
      end

      if _actual.is_a?(SSS::Property)
        _actual.should be_same_property_as _expected
      end

      if _actual.is_a?(SSS::Rule)
        _actual.should be_same_rule_as _expected
      end
    end
  end
end
