require 'spec_helper'

describe SSS::Import do

  before do
    SSS::BASE_DIR = Dir.pwd
  end

  subject do
    SSS::Import.new("spec/sss/fixtures/sample.sss")
  end

  describe 'to_css' do
    it 'should return the proper css' do
      expected_css = "h1 {  }\nh1 p { font-size: 10px; }\n"
      subject.to_css(nil).should == expected_css
    end
  end
end
