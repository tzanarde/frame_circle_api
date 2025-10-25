RSpec.shared_context 'with invalid frame attributes to add' do |frame_trait|
  let!(:frame_params) { attributes_for(:frame, :common_frame, height: nil) }
end