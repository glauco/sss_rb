require 'spec_helper'
require 'sss/parser.tab' 
require 'sss/literal'

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

  it 'should compile variables' do
    input = "p { @a: 10px; width: @a; }"

    expected_css = "p { width: 10px; }\n"

    style_sheet = subject.scan_str(input)
    generated_css = style_sheet.to_css()

    generated_css.should == expected_css
  end

  it 'should compile variables from parent scope' do
    input = "@a: 10px;\np { width: @a; }"

    expected_css = "p { width: 10px; }\n"
    
    style_sheet = subject.scan_str(input)
    generated_css = style_sheet.to_css()

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
    values.should be_same_literals_as [SSS::Literal.new('#f0f0f0')]
  end

  it 'should parse dimensions' do
    values = parse_values('10px 1.2em 5.1%')
    values.should be_same_literals_as [
      SSS::Literal.new('10px'), 
      SSS::Literal.new('1.2em'),
      SSS::Literal.new('5.1%')]
  end

  it 'should parse variables' do
    property = parse_directive('height: @a')

    expected_property = SSS::Property.new('height', [
      SSS::Variable.new('@a')])

    property.should be_same_property_as expected_property
  end

  it 'should parse assignation' do
    assignment = parse_directive("@a: 1")

    expected_assignment = SSS::Assign.new('@a', [
      SSS::Literal.new('1')])

    assignment.should be_same_assign_as expected_assignment
  end

  it 'should parse assignation from root' do
    style_sheet = subject.scan_str("@a: 1")

    expected_style_sheet = SSS::StyleSheet.new([
      SSS::Assign.new('@a', [
        SSS::Literal.new('1')])
    ])

    style_sheet.should be_same_style_sheet_as expected_style_sheet
  end
 
  # Helpers
  def parse_rule(css)
    subject.scan_str(css).statements.first
  end

  def parse_directive(css)
    parse_rule('h1 { ' + css + ' }').declarations.first
  end

  def parse_values(values)
    parse_directive('property: ' + values).values
  end
end
