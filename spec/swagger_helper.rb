require 'rails_helper'

RSpec.configure do |config|
  config.openapi_root = Rails.root.join('swagger').to_s

  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Frame Circle API',
        version: 'v1',
        description: 'API documentation for managing frames and circles.'
      },
      paths: {},
      servers: [
        {
          url: 'http://{defaultHost}',
          description: 'Local development server',
          variables: {
            defaultHost: {
              default: '192.168.15.81:3000'
            }
          }
        }
      ]
    }
  }

  config.openapi_format = :yaml
end
