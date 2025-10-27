class FrameSerializer < ActiveModel::Serializer
  attributes :id, :center_x, :center_y, :width, :height

  has_many :circles, if: -> { object.circles.any? }
end
