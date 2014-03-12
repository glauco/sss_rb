require 'spec_helper'
require 'sss/parser.tab' 

describe SSS::Parser do
  it 'should compile empty rules' do
    empty_rules = "h1 {  }\np {  }\n"

    style_sheet = subject.scan_str(empty_rules)
    generated_css = style_sheet.to_css

    generated_css.should == empty_rules
  end

  it 'should compile properties' do
    rules_with_props = "h1 { font-size: 10px; padding: 10px 20px; }\n"

    style_sheet = subject.scan_str(rules_with_props)
    generated_css = style_sheet.to_css

    generated_css.should == rules_with_props
  end

  it 'should compile nested rules' do
    nested_rules = "h1 {\np { font-size: 10px; }\n}\n"

    expected_css = "h1 {  }\nh1 p { font-size: 10px; }\n"

    style_sheet = subject.scan_str(nested_rules)
    generated_css = style_sheet.to_css

    generated_css.should == expected_css
  end

  it 'should parse h1 selector' do
    selector = 'h1'
    actual = parse_rule("#{selector} {}").selector
    actual.should == selector
  end

  it 'should parse #id selector' do
    selector = '#id'
    actual = parse_rule("#{selector} {}").selector
    actual.should == selector
  end

  it 'should parse .class selector' do
    selector = '.class'
    actual = parse_rule("#{selector} {}").selector
    actual.should == selector
  end

  it 'should parse h1.class selector' do
    selector = 'h1.class'
    actual = parse_rule("#{selector} {}").selector
    actual.should == selector
  end

  it 'should parse a:hover selector' do
    selector = 'a:hover'
    actual = parse_rule("#{selector} {}").selector
    actual.should == selector
  end

  it 'should parse ::after selector' do
    selector = '::after'
    actual = parse_rule("#{selector} {}").selector
    actual.should == selector
  end

  it 'should parses color' do
    values = parse_values('#f0f0f0')
    values.should == ['#f0f0f0']
  end

  it 'should parse dimensions' do
    values = parse_values('10px 1.2em 5.1%')
    values.should == ['10px', '1.2em', '5.1%']
  end

  # Helpers
  def parse_rule(css)
    subject.scan_str(css).rules.first
  end

  def parse_directive(css)
    parse_rule('h1 { ' + css + ' }').declarations.first
  end

  def parse_values(values)
    parse_directive('property: ' + values).values
  end
end
