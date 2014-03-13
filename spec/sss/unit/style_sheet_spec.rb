require 'spec_helper'
require 'sss/style_sheet'

describe SSS::StyleSheet do
  let(:statements) { [SSS::Rule.new('body', [])] }
  subject { SSS::StyleSheet.new(statements) }

  it 'should have a bunch of statements' do
    subject.statements.should == statements
  end
  
  describe 'to_css' do
    it 'should return the proper css if statements are provided' do
      subject.to_css.should == "body {  }\n"
    end

    it 'should return empty if statements are not provided' do
      subject = SSS::StyleSheet.new(nil)
      subject.to_css.should == ''
    end
  end
end
