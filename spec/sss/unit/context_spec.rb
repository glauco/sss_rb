require 'spec_helper'
require 'sss/parser.tab'

describe SSS::Context do
  let(:rule) { SSS::Rule.new('body', []) }
  let(:parent) { SSS::Context.new(rule) }

  it 'should return empty if no rule and no parent is specified' do
    subject = SSS::Context.new(nil, nil)
    subject.selector.should be_empty
  end

  it 'should return parent selector if only parent is specified' do
    subject = SSS::Context.new(nil, parent)
    subject.selector.should == 'body'
  end

  it 'should return rule selector if only rule is specified' do
    subject =  SSS::Context.new(
      SSS::Rule.new('a', []), nil)

    subject.selector.should == 'a'
  end

  it 'should return rule and parent selectors if both are specified' do
    parent = SSS::Context.new(
      SSS::Rule.new('body', []))

    subject = SSS::Context.new(
      SSS::Rule.new('a', []), parent)

    subject.selector.should == 'body a'
  end
end
