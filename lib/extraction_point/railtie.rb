module ExtractionPoint
  class Railtie < Rails::Railtie
    config.extraction_point = ActiveSupport::OrderedOptions.new
    config.extraction_point.hostname = ''
    config.extraction_point.output_filepath = 'route_helpers.rb'
    config.extraction_point.output_namespace = :extraction_point

    config.after_initialize do |app|
      ExtractionPoint::Railtie.boot!(app)
    end

    protected

      def boot!(app)
        Rails.application.reload_routes!
        ExtractionPoint.export! Rails.application.routes,
          hostname:          app.config.extraction_point.hostname,
          output_file:       Rails.root.join(app.config.extraction_point.output_filepath),
          output_namespace:  app.config.extraction_point.output_namespace
      end

  end
end
