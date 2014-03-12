require 'spec_helper'
require 'sss/style_sheet'

describe SSS::StyleSheet do
  let(:rules) { [SSS::Rule.new('body', [])] }
  subject { SSS::StyleSheet.new(rules) }

  it 'should have a bunch of rules' do
    subject.rules.should == rules
  end
  
  describe 'to_css' do
    it 'should return the proper css if rules are provided' do
      subject.to_css.should == "body {  }\n"
    end

    it 'should return empty if rules are not provided' do
      subject = SSS::StyleSheet.new(nil)
      subject.to_css.should == ''
    end
  end
end
