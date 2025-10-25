RSpec.shared_context 'with a frame' do |frame_trait|
  let!(:frame_params) { create(:frame, frame_trait) }
  let!(:id) { frame_params.id }
end
