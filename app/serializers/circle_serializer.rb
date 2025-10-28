class CircleSerializer < ActiveModel::Serializer
  attributes :id, :center_x, :center_y, :diameter, :frame_id

  def center_x = "#{object.center_x.to_f} cm"
  def center_y = "#{object.center_y.to_f} cm"
  def diameter = "#{object.diameter.to_f} cm"
end
