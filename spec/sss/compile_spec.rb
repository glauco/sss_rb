require 'spec_helper'
require 'sss/parser.tab'

describe SSS::Parser do
  
  describe 'Compilation to CSS' do
    before :each do
      @parser = SSS::Parser.new()
    end

    it 'compiles empty rule' do
      input = "h1 {  }\n p {  }"

      actual = @parser.scan_str(input).to_css()

      actual.should == input
    end

    it 'compiles properties' do
      input = "h1 { font-size: 10px; padding: 10px 20px; }"

      actual = @parser.scan_str(input).to_css()

      actual.should == input
    end
  end
end
