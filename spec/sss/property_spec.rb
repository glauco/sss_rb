require 'spec_helper'
require 'sss/property'

describe SSS::Property do
  before :each do
    @property = SSS::Property.new('border', ['#ccc', '1px', '1px', '1px', '1px'])
  end

  it 'should have a name and a bunch of values' do
    property = SSS::Property.new('border', ['#ccc', '1px', '1px', '1px', '1px'])

    property.name.should == 'border'
    property.values.should == ['#ccc', '1px', '1px', '1px', '1px']
  end

  describe '==' do
    it 'should return true if two objects have the same name and no values' do
      property = SSS::Property.new('border', nil)
      another_property = SSS::Property.new('border', nil)

      property.should == another_property
    end

    it 'should return false if two objects have differents names and no values' do
      property = SSS::Property.new('border', nil)
      another_property = SSS::Property.new('background', nil)

      property.should_not == another_property
    end

    it 'should return true if two objects have the same value and same values' do
      property = SSS::Property.new('border', ['#ccc', '1px', '1px', '1px', '1px'])
      another_property = SSS::Property.new('border', ['#ccc', '1px', '1px', '1px', '1px'])

      property.should == another_property
    end

    it 'should return false if two objects have the same value but different values' do
      property = SSS::Property.new('border', ['#ccc', '1px', '1px', '1px', '1px'])
      another_property = SSS::Property.new('border', ['#ccc', '1px', '1px', '10px', '1px'])

      property.should_not == another_property
    end
  end

  describe 'to_css' do
    it 'should return the proper css if name and values are provided' do
      @property.to_css.should == 'border: #ccc 1px 1px 1px 1px;'
    end

    it 'should return empty if both name and values are not provided' do
      @property = SSS::Property.new(nil, nil)
      @property.to_css.should == ''
    end
  end
end
