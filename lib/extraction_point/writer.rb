module ExtractionPoint
  class Writer

    def self.write!(payload, options)
      File.open(options[:output_file], 'w+') do |f|
        f.puts "module #{options[:output_namespace].to_s.classify}"
        f.puts "  module RouteHelpers\n"
        f.puts payload.join("\n")
        f.puts "  end"
        f.puts "end"
      end
    end

  end
end
