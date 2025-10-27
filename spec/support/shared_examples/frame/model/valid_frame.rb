RSpec.shared_examples 'a valid frame' do
  before { frame_to_add.save }

  it 'creates a frame' do
    expect(frame_to_add).to be_persisted
  end

  it 'has no validation errors' do
    expect(frame_to_add.errors).to be_empty
  end

  it 'has the correct values' do
    expect(frame_to_add.center_x).to eq(attributes_for_frame_to_add[:center_x])
    expect(frame_to_add.center_y).to eq(attributes_for_frame_to_add[:center_y])
    expect(frame_to_add.width).to eq(attributes_for_frame_to_add[:width])
    expect(frame_to_add.height).to eq(attributes_for_frame_to_add[:height])
  end
end

RSpec.shared_examples 'an extreme position circle within the frame' do |position|
  [:topmost, :rightmost, :bottommost, :leftmost].each do |position|
    include_context 'with an extreme circle within the frame', position
  end
  
  let(:expected_circle) { existing_frame.public_send("#{position}_circle") }

  it 'returns the expected center_x position for the circle' do
    expect(expected_circle['center_x']).to eq(public_send("#{position}_circle")[:center_x])
  end

  it 'returns the expected center_y position for the circle' do
    expect(expected_circle['center_y']).to eq(public_send("#{position}_circle")[:center_y])
  end
end

RSpec.shared_examples 'the amount of circles within a frame' do
  it 'returns the correct amount' do
    expect(existing_frame.circles_amount).to eq(2)
  end
end