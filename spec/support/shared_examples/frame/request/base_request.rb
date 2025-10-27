RSpec.shared_examples 'a base frame response' do |frame|
  let(:json) { JSON.parse(response.body) }
  let(:frame_attribute_names) { [:center_x, :center_y, :width, :height] }

  it 'returns no errors in the response' do
    expect(json['errors']).to be_nil
  end

  it 'returns the correct values related to the frame' do
    frame_attribute_names.each do |attribute|
      expect(json[attribute.to_s].to_f).to eq(public_send(frame)[attribute])
    end
  end
end