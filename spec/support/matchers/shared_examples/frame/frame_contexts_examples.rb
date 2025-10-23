RSpec.shared_context 'with a frame to add' do |frame_trait|
  let(:attributes_for_frame_to_add) { attributes_for(:frame, frame_trait) }
  let(:frame_to_add) { Frame.new(attributes_for_frame_to_add) }
end

RSpec.shared_context 'with an existing frame' do |frame_trait|
  let(:attributes_for_existing_frame) { attributes_for(:frame, frame_trait) }
  let!(:existing_frame) { Frame.create(attributes_for_existing_frame) }
end
