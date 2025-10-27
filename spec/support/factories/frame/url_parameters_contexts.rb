RSpec.shared_context 'with a not existing frame' do |id|
  let!(id) { 99999 }
end

RSpec.shared_context 'with frame id url parameters' do |frame|
  let!(:id) { public_send(frame).id }
end