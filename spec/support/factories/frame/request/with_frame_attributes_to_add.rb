RSpec.shared_context 'with frame attributes to add' do |frame_trait|
  let!(:frame_params) { attributes_for(:frame, frame_trait) }
end