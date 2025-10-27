CIRCLE_POST_SCHEMA = {
  type: :object,
  properties: {
    circle: {
      type: :object,
      properties: {
        center_x: { type: :number },
        center_y: { type: :number },
        diameter: { type: :number }
      }
    }
  },
  required: ['circle']
}.freeze
