desc "Explaining what the task does"
namespace :extraction_point do
  desc "Export the routes into a file available to external applications, based on the application config"
  task :export => :environment do
    Rails.application.reload_routes! #Ensure rails routes are loaded
    ExtractionPoint.export! Rails.application.routes,
      hostname:          Rails.configuration.extraction_point.hostname,
      output_file:       Rails.root.join(Rails.configuration.extraction_point.output_filepath),
      output_namespace:  Rails.configuration.extraction_point.output_namespace
  end
end
