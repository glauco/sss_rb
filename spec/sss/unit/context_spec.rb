require 'spec_helper'
require 'sss/parser.tab'

describe SSS::Context do
  let(:rule) { SSS::Rule.new('body', []) }

  let(:parent) do
    context = SSS::Context.new(rule)
    context.set('@parent', true)
    context
  end

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


  describe 'variables' do
    subject do
      context = SSS::Context.new(
        SSS::Rule.new("a", []), parent)
      context.set("@var", true)
      context
    end


    it 'returns variable' do
      subject.get('@var').should be_true
    end

    it 'returns variable from parent' do
      subject.get('@parent').should be_true
    end

    it 'overrides variable from parents' do
      subject.set('@parent', 'indeed')
      subject.get('@parent').should == 'indeed'
    end
  end
end
