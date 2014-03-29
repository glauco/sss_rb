module SSS
  class Import
    def initialize(path)
      @path = path.chomp("'").reverse.chomp("'").reverse
    end

    def to_css(context)
      input = File.read(File.expand_path("../../../samples/#{@path}", __FILE__))
      stylesheet = SSS::Parser.new
      stylesheet.scan_str(input).to_css
    end
  end
end
