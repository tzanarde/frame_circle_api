RSpec.shared_context 'with frame attributes to add with circles within' do |frame_trait, circle_traits|
  let!(:frame_params) do
    attributes_for(:frame, frame_trait)
      .merge(circles_attributes: Array(circle_traits).map { |circle_trait| attributes_for(:circle, circle_trait) })
  end
end