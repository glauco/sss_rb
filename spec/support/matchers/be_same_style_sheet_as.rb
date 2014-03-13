require 'rspec/expectations'

RSpec::Matchers.define :be_same_style_sheet_as do |expected|
  match do |actual|
    actual.statements.should be_same_statements_as expected.statements
  end
end
