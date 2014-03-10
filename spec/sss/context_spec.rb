require 'spec_helper'
require 'sss/parser.tab'

describe SSS::Context do
  before :each do
    @parent = SSS::Context.new(
      SSS::Rule.new('body', []))
  end

  it 'should return empty if no rule and no parent is specified' do
    @context = SSS::Context.new(nil, nil)
    @context.selector.should == ''
  end

  it 'should return an empty array if no rule and no parent is specified' do
    @context = SSS::Context.new(nil, nil)
    @context.selectors.should == [] 
  end

  it 'should return parent selector if only parent is specified' do
    @context = SSS::Context.new(nil, @parent)
    @context.selector.should == 'body'
  end

  it 'should return an array with parent selector if only parent is specified' do
    @context = SSS::Context.new(nil, @parent)
    @context.selectors.should == ['body']
  end

  it 'should return rule selector if only rule is specified' do
    @context =  SSS::Context.new(
      SSS::Rule.new('a', []), nil)

    @context.selector.should == 'a'
  end

  it 'should return an array with rule selector if rule is specified' do
    @context =  SSS::Context.new(
      SSS::Rule.new('a', []), nil)

    @context.selectors.should == ['a']
  end

  it 'should return rule and parent selectors if both are specified' do
    @parent = SSS::Context.new(
      SSS::Rule.new('body', []))

    @context = SSS::Context.new(
      SSS::Rule.new('a', []), @parent)

    @context.selector.should == 'body a'
  end

  it 'should return an array with rule and parent selectors if both are specified' do
    @context = SSS::Context.new(
      SSS::Rule.new('a', []), @parent)

    @context.selectors.should == ['body', 'a']
  end

end
