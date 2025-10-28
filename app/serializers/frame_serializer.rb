class FrameSerializer < ActiveModel::Serializer
  attributes :id, :center_x, :center_y, :width, :height

  has_many :circles, if: -> { object.circles.any? }

  def center_x = "#{object.center_x.to_f} cm"
  def center_y = "#{object.center_y.to_f} cm"
  def width = "#{object.width.to_f} cm"
  def height = "#{object.height.to_f} cm"
end
