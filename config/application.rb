require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'arel-helpers'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.web_console.whitelisted_ips = '172.17.0.1'
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.

    config.i18n.available_locales = ["pt-BR"]
    config.i18n.default_locale = :"pt-BR"

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    env_file = File.join(Rails.root, 'config', 'local_env.yml')
    YAML.load(File.open(env_file)).each do |key, value|
      ENV[key.to_s] = value
    end if File.exists?(env_file)
  end
end
