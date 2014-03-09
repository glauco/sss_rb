#--
# DO NOT MODIFY!!!!
# This file is automatically generated by rex 1.0.5
# from lexical definition file "lib/sss/parser.rex".
#++

require 'racc/parser'
module SSS
class Parser < Racc::Parser
  require 'strscan'

  class ScanError < StandardError ; end

  attr_reader   :lineno
  attr_reader   :filename
  attr_accessor :state

  def scan_setup(str)
    @ss = StringScanner.new(str)
    @lineno =  1
    @state  = nil
  end

  def action
    yield
  end

  def scan_str(str)
    scan_setup(str)
    do_parse
  end
  alias :scan :scan_str

  def load_file( filename )
    @filename = filename
    open(filename, "r") do |f|
      scan_setup(f.read)
    end
  end

  def scan_file( filename )
    load_file(filename)
    do_parse
  end


  def next_token
    return if @ss.eos?
    
    # skips empty actions
    until token = _next_token or @ss.eos?; end
    token
  end

  def _next_token
    text = @ss.peek(1)
    @lineno  +=  1  if text == "\n"
    token = case @state
    when nil
      case
      when (text = @ss.scan(/\s+/))
        ;

      when (text = @ss.scan(/[0-9]+(\.[0-9]+)?(px|em|\%)/))
         action { [:DIMENSION, text] } # 10px, 1em, 50%

      when (text = @ss.scan(/[0-9]+(\.[0-9]+)?/))
         action { [:NUMBER, text] } # 0

      when (text = @ss.scan(/\#[0-9A-Fa-f]{3,6}/))
         action { [:COLOR, text] } # #fff, #f0f0f0

      when (text = @ss.scan(/(\.|\#|\:\:|\:)[a-zA-Z][\w\-]*/))
         action { [:SELECTOR, text] } # .class, #id

      when (text = @ss.scan(/[a-zA-Z][\w\-]*(\.|\#|\:\:|\:)[a-zA-Z][\w\-]*/))
         action { [:SELECTOR, text] } # div.class, body#id

      when (text = @ss.scan(/[a-zA-Z][\w\-]*/))
         action { [:IDENTIFIER, text] } # body, font-size

      when (text = @ss.scan(/./))
         action { [text, text] } # {, }, +, :, ;

      else
        text = @ss.string[@ss.pos .. -1]
        raise  ScanError, "can not match: '" + text + "'"
      end  # if

    else
      raise  ScanError, "undefined state: '" + state.to_s + "'"
    end  # case state
    token
  end  # def _next_token

end # class
end
