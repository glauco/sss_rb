require 'spec_helper'
require 'sss/property'

describe SSS::Property do
  subject { SSS::Property.new('border', ['#ccc', '1px', '1px', '1px', '1px']) } 

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
