require 'spec_helper'
require 'sss/parser.tab' 

describe SSS::Parser do
  it 'should parse empty rules' do
    empty_rules = "h1 {}\np {}\n"

    style_sheet = subject.scan_str(empty_rules)

    expected_style_sheet = SSS::StyleSheet.new([
      SSS::Rule.new('h1', []),
      SSS::Rule.new('p', [])
    ])

    style_sheet.should be_same_style_sheet_as expected_style_sheet
  end

  it 'should parse properties' do
    input = 'h1 { font-size: 10px; padding: 10px 20px; }'

    style_sheet = subject.scan_str(input)

    expected_style_sheet = SSS::StyleSheet.new([
      SSS::Rule.new('h1', [
        SSS::Property.new('font-size', ['10px']),
        SSS::Property.new('padding', %w{10px 20px})
      ])
    ])

    style_sheet.should be_same_style_sheet_as expected_style_sheet
  end
end
