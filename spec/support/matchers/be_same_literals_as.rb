require 'rspec/expectations'

RSpec::Matchers.define :be_same_literals_as do |expected|
  match do |actual|
    actual.zip(expected).each do |_actual, _expected|
      _actual.should be_same_literal_as _expected
    end
  end
end
