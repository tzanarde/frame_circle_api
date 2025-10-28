class FrameShowSerializer < ActiveModel::Serializer
  attributes :id,
             :center_x,
             :center_y,
             :width,
             :height,
             :topmost_circle,
             :rightmost_circle,
             :bottommost_circle,
             :leftmost_circle,
             :circles_amount

  has_many :circles, serializer: CircleWithinFrameSerializer, if: -> { object.circles.any? }

  def center_x = "#{object.center_x.to_f} cm"
  def center_y = "#{object.center_y.to_f} cm"
  def width = "#{object.width.to_f} cm"
  def height = "#{object.height.to_f} cm"

  %w[topmost_circle rightmost_circle bottommost_circle leftmost_circle].each do |method_name|
    define_method(method_name) do
      circle_data = object.public_send(method_name)
      return nil unless circle_data.present?

      { center_x: "#{circle_data['center_x'].to_f} cm",
        center_y: "#{circle_data['center_y'].to_f} cm" }
    end
  end
end
