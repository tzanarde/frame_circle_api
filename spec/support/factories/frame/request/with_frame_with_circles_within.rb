RSpec.shared_context 'with frame with circles within' do|frame_trait, circle_traits|
  let!(:frame_params) { create(:frame, frame_trait) }
  let!(:circles) do
    circle_traits.map { |circle_trait| create(:circle, circle_trait, frame: frame_params) }
  end
  let!(:id) { frame_params.id }
end