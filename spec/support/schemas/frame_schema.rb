FRAME_SCHEMA = {
  type: :object,
  properties: {
    frame: {
      type: :object,
      properties: {
        center_x: { type: :number },
        center_y: { type: :number },
        width: { type: :number },
        height: { type: :number },
        circles_attributes: {
          type: :array,
          items: {
            type: :object,
            properties: {
              center_x: { type: :number },
              center_y: { type: :number },
              diameter: { type: :number }
            }
          }
        }
      }
    }
  },
  required: ['frame']
}.freeze
