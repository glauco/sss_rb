require 'spec_helper'
require 'sss/parser.tab'

describe SSS::Context do
  before :each do
    @parent = SSS::Context.new(
      SSS::Rule.new('body', []))

    @context = SSS::Context.new(
      SSS::Rule.new('a', []), @parent)
  end

  it 'should return selectors' do
    @context.selectors.should == %w{body a}
  end

  it 'should compile selector from parent context' do
    @context.selector.should == 'body a'
  end
end
