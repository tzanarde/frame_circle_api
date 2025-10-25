RSpec.shared_examples 'an extreme position circle within the frame' do |position|
  [:topmost, :rightmost, :bottommost, :leftmost].each do |position|
    include_context 'with an extreme circle within the frame', position
  end
  
  let(:expected_circle) { existing_frame.public_send("#{position}_circle") }

  it 'returns the expected center_x position for the circle' do
    expect(expected_circle[:center_x]).to eq(public_send("#{position}_circle")[:center_x])
  end

  it 'returns the expected center_y position for the circle' do
    expect(expected_circle[:center_y]).to eq(public_send("#{position}_circle")[:center_y])
  end
end

RSpec.shared_examples 'the amount of circles within a frame' do
  it 'returns the correct amount' do
    expect(existing_frame.circles_amount).to eq(2)
  end
end