module GorgEngine
  class Engine < ::Rails::Engine

    require 'haml-rails'
    require 'jquery-rails'
    require 'jquery-ui-rails'
    require 'unobtrusive_flash'
    require 'materialize-sass'
    require 'uglifier'
    require 'devise'
    require 'omniauth'
    require 'omniauth-cas'
    require 'devise_masquerade'
    require 'cancancan'
    require 'will_paginate'
    require 'will_paginate/active_record'
    require 'awesome_print'
    require 'gorg_slack_chat'

    config.generators do |g|
      g.template_engine :haml
    end

    #Load all controllers by default
    config.eager_load_paths << File.expand_path("../app", __FILE__)

    # Load helpers to the app
    require GorgEngine::Engine.config.root + 'app' + 'helpers' + 'application_helper'
  end
end
