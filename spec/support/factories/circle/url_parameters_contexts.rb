RSpec.shared_context 'with a not existing circle id on url parameters' do |frame_trait|
  let!(:id) { 99999 }
end

RSpec.shared_context 'with circle id on url parameters' do |parameter, existing_frame, circle_index|
  let!(parameter) { public_send(existing_frame).circles[circle_index].id }
end

RSpec.shared_context 'with frame id on url parameters' do |parameter, existing_frame|
  let(parameter) { public_send(existing_frame).id }
end

RSpec.shared_context 'with position for an area on url parameters' do |center_x, center_y, radius|
  let(:center_x) { center_x }
  let(:center_y) { center_y }
  let(:radius) { radius }
end

RSpec.shared_context 'with blank url parameters' do
  let(:center_x) { nil }
  let(:center_y) { nil }
  let(:radius) { nil }
  let(:frame_id) { nil }
end
