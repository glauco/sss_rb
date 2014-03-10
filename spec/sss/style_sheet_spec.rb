require 'spec_helper'
require 'sss/style_sheet'

describe SSS::StyleSheet do
  before :each do
    @rules = [SSS::Rule.new('body', [])]
    @style_sheet = SSS::StyleSheet.new(@rules)
  end

  it 'should have a bunch of rules' do
    style_sheet = SSS::StyleSheet.new(@rules)

    style_sheet.rules.should == @rules
  end
  
  describe '==' do
    it 'should return true if two objects have the same rules' do
      style_sheet = SSS::StyleSheet.new(@rules)

      another_style_sheet = SSS::StyleSheet.new(@rules)

      style_sheet.should == another_style_sheet 
    end

    it 'should return false if two objects have differents names and no values' do
      style_sheet = SSS::StyleSheet.new(@rules)

      another_style_sheet = SSS::StyleSheet.new([])

      style_sheet.should_not == another_style_sheet
    end
  end

  describe 'to_css' do
    it 'should return the proper css if rules are provided' do
      @style_sheet.to_css.should == "body {  }\n"
    end

    it 'should return empty if rules are not provided' do
      @style_sheet = SSS::StyleSheet.new(nil)
      @style_sheet.to_css.should == ''
    end
  end
end
