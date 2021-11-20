require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VPKInfoSystem
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
