require 'spec_helper'
require 'sss/property'
require 'sss/literal'

describe SSS::Property do
  subject do
    SSS::Property.new(
      'border', 
      [SSS::Literal.new('#ccc'), 
       SSS::Literal.new('1px'), 
       SSS::Literal.new('1px'), 
       SSS::Literal.new('1px'), 
       SSS::Literal.new('1px')]) 
  end

  describe 'to_css' do
    it 'should return the proper css if name and values are provided' do
      subject.to_css.should == 'border: #ccc 1px 1px 1px 1px;'
    end

    it 'should return empty if both name and values are not provided' do
      subject = SSS::Property.new(nil, nil)
      subject.to_css.should be_empty
    end
  end
end
