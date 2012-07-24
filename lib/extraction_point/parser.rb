module ExtractionPoint
  class Parser

  attr_reader :exportable

  def initialize(routes, options={})
    @options = options
    @routes = routes.named_routes.routes
    @keys = routes.named_routes.routes.keys
    @exportable = []
    compile_methods
  end

  def compile_methods
    @keys.each do |key|
      @exportable << parse_route(@routes[key.to_sym]) if @routes[key.to_sym]
    end
  end

  private

    def parse_route(route)
      if @options[:hostname].kind_of? Proc
        hostname = @options[:hostname].call
      else
        hostname = @options[:hostname]
      end
      x = <<-EOF
    def #{route.name}_path(#{set_up_arguments(route.segment_keys)}options={})
      "#{parse_path(route)}"
    end

    def #{route.name}_url(#{set_up_arguments(route.segment_keys)}options={})
      "http://#{hostname}#{parse_path(route)}"
    end
      EOF
    end

    def set_up_arguments(segment_keys)
      segment_keys.reject! { |x| x == :format }
      return if segment_keys.blank?
      segment_keys.map { |x| x.to_s }.join(', ') + ", "
    end

    def parse_path(route)
      path = strip_format(route.path)
      route.segment_keys.each do |key|
        path = path.sub(":#{key.to_s}", "\#{#{key.to_s}}")
      end
      path
    end

    def strip_format(path)
      path.gsub("(.:format)", "")
    end

  end
end
