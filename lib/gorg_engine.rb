require "gorg_engine/engine"

module GorgEngine
  module Sass

    class << self

      def load!
        #register_compass_extension if compass?
        if rails?
          register_rails_engine
        elsif sprockets?
          register_sprockets
        end
        configure_sass
      end

      # Paths
      def gem_path
        @gem_path ||= File.expand_path '..', File.dirname(__FILE__)
      end

      def stylesheets_path
        File.join  assets_path, 'stylesheets'
      end

      def fonts_path
        File.join assets_path, 'fonts'
      end

      def javascripts_path
        File.join assets_path, 'javascripts'
      end

      def assets_path
        @assets_path ||= File.join gem_path, 'app/assets'
      end

      # Environment detection helpers
      def sprockets?
        defined?(::Sprockets)
      end

      def rails?
        defined?(::Rails)
      end

      private
      def configure_sass
        require 'sass'
        ::Sass.load_paths << stylesheets_path
      end

      def register_rails_engine
        require 'gorg_engine/engine'
      end


      def register_sprockets
        Sprockets.append_path(stylesheets_path)
        Sprockets.append_path(fonts_path)
        Sprockets.append_path(javascripts_path)
      end
    end
  end
end

GorgEngine::Sass.load!