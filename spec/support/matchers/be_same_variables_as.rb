require 'rspec/expectations'
require 'sss/variable'

RSpec::Matchers.define :be_same_variables_as do |expected|
  match do |actual|
    actual.zip(expected).each do |actual_variable, expected_variable|
      actual_variable.should be_same_variable_as expected_variable
    end
  end
end
