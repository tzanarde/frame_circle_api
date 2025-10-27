RSpec.shared_context 'with a frame' do |frame, frame_trait|
  let!(frame) { create(:frame, frame_trait) }
end

RSpec.shared_context 'with invalid circle new position overlapping the frame' do
  let(:circle_params) do
    { circle: attributes_for(:circle, :circle_new_position_overlapping_frame).slice(:center_x, :center_y, :diameter) }
  end
end

RSpec.shared_context 'with invalid frame attributes to add' do |frame_trait|
  let!(:frame_params) { attributes_for(:frame, :common_frame, height: nil) }
end
