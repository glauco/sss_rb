module SSS
  class Import
    def initialize(path)
      @path = path
    end

    def to_css(context)
      input = File.read(File.expand_path(@path, SSS::BASE_DIR))
      stylesheet = SSS::Parser.new.scan_str(input)
      stylesheet.to_css
    end
  end
end
