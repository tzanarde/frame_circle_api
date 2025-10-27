CIRCLE_PUT_SCHEMA = {
  type: :object,
  properties: {
    circle: {
      type: :object,
      properties: {
        center_x: { type: :number },
        center_y: { type: :number },
        diameter: { type: :number },
        frame_id: { type: :integer }
      }
    }
  },
  required: ['circle']
}.freeze
