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
end
