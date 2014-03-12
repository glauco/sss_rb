require 'rspec/expectations'

RSpec::Matchers.define :be_same_style_sheet_as do |expected|
  match do |actual|
    actual.rules.should be_same_rules_as expected.rules  
  end
end
