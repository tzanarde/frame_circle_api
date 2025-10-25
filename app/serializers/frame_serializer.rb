class FrameSerializer < ActiveModel::Serializer
  attributes :id,
             :center_x,
             :center_y,
             :width,
             :height,
             :created_at,
             :updated_at,
             :topmost_circle,
             :rightmost_circle,
             :bottommost_circle,
             :leftmost_circle,
             :circles_amount

  has_many :circles, if: -> { object.circles.any? }
end
