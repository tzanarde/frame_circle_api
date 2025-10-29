source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.4"
# Use PostgreSQL as the database for Active Record
gem "pg", "~> 1.6.2"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Gems for Swagger API documentation
gem 'rswag-api'
gem 'rswag-ui'

# Gem for serialization
gem 'active_model_serializers'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  # For ENV variables
  gem 'dotenv-rails'

  # For the RSpec specification, tests and mocks
  gem 'rspec-rails', '~> 8.0'
  gem 'factory_bot_rails'

  # For debuging
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'

  # Gem for Swagger API specification
  gem 'rswag-specs'
end

group :test do
  # Gem for rspec matchers
  gem 'shoulda-matchers', '~> 6.0'
end
