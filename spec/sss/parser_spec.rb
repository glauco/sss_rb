require 'spec_helper'
require 'sss/parser.tab'

describe SSS::Parser do
  before :each do
    @parser = SSS::Parser.new()
  end

  it 'should parse empty rules' do
    empty_rules = <<-INPUT
    h1 {}
    p {}
    INPUT

    actual_style_sheet = @parser.scan_str(empty_rules)

    expected_style_sheet = StyleSheet.new([
      Rule.new('h1', []),
      Rule.new('p', [])
    ])

    actual_style_sheet.should == expected_style_sheet
  end

  it 'parse properties' do
    input = <<-INPUT
    h1 { font-size: 10px; padding: 10px 20px; }
    INPUT

    actual_style_sheet = @parser.scan_str(input)

    expected_style_sheet = StyleSheet.new([
      Rule.new('h1', [
        Property.new('font-size', [ '10px' ]),
        Property.new('padding', [ '10px', '20px' ])
      ])
    ])

    actual_style_sheet.should == expected_style_sheet
  end

  describe 'selector' do
    it 'parses h1 selector' do
      selector = 'h1'
      actual = parseRule(selector + ' {}').selector
      actual.should == selector
    end

    it 'parses #id selector' do
      selector = '#id'
      actual = parseRule(selector + ' {}').selector
      actual.should == selector
    end

    it 'parses .class selector' do
      selector = '.class'
      actual = parseRule(selector + ' {}').selector
      actual.should == selector
    end

    it 'parses h1.class selector' do
      selector = 'h1.class'
      actual = parseRule(selector + ' {}').selector
      actual.should == selector
    end

    it 'parses a:hover selector' do
      selector = 'a:hover'
      actual = parseRule(selector + ' {}').selector
      actual.should == selector
    end

    it 'parses ::after selector' do
      selector = '::after'
      actual = parseRule(selector + ' {}').selector
      actual.should == selector
    end
  end

  describe 'values' do
    it 'parses color' do
      values = parseValues('#f0f0f0')
      values.should == [ '#f0f0f0' ]
    end

    it 'parses dimensions' do
      values = parseValues('10px 1.2em 5.1%')
      values.should == [ '10px', '1.2em', '5.1%' ]
    end
  end

  # Helpers
  def parseRule(css)
    @parser.scan_str(css).rules[0]
  end

  def parseDirective(css)
    parseRule('h1 { ' + css + ' }').properties[0]
  end

  def parseValues(values)
    parseDirective('property: ' + values).values
  end
end
