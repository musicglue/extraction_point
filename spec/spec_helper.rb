$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'rails/all'
require 'extraction_point'
require "active_support/core_ext/hash/slice"

class App < Rails::Application
  config.extraction_point.hostname = 'test-web.com'
  config.extraction_point.output_filepath = 'route_helpers.rb'
  config.extraction_point.output_namespace = :extraction_point
end

def draw_routes

  App.routes.draw do
    resources :inboxes do
      resources :messages do
        resources :attachments
      end
    end

    namespace :admin do
      resources :users
    end
  end

end


