require 'spec_helper'
require 'sss/property'
require 'sss/rule'


describe SSS::Rule do
  let(:declarations) { [SSS::Property.new('border', ['#ccc', '1px', '1px', '1px', '1px'])] }
  subject { SSS::Rule.new('h1', declarations) }

  it 'should have a selector' do
    subject.selector.should == 'h1'
  end

  it 'should have a bunch of declarations' do
    subject.declarations.should == declarations
  end

  describe 'to_css' do
    it 'should return the proper css if selector and declarations are provided' do
      expected_css = "h1 { border: #ccc 1px 1px 1px 1px; }\n"
      subject.to_css.should == expected_css
    end

    it 'should return empty if both selector and declaration are not provided' do
      subject = SSS::Rule.new(nil, nil)
      subject.to_css.should be_empty
    end
  end
end
