require "extraction_point/version"
require "extraction_point/parser"
require "extraction_point/writer"
require 'extraction_point/railtie.rb' if defined?(Rails)

module ExtractionPoint
  extend self

  def export!(routes, options={})
    parser = Parser.new(routes, options)
    Writer.write!(parser.exportable, options)
  end
end
