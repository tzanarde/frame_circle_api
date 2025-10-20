RSpec.shared_examples 'a valid frame' do
  it 'creates a frame' do
    expect(frame_to_add).to be_valid.and be_persisted

    expect(frame_to_add.errors).to be_empty

    expect(frame_to_add.center_x).to eq(attributes_for_frame_to_add[:center_x])
    expect(frame_to_add.center_y).to eq(attributes_for_frame_to_add[:center_y])
    expect(frame_to_add.width).to eq(attributes_for_frame_to_add[:width])
    expect(frame_to_add.height).to eq(attributes_for_frame_to_add[:height])
  end
end

RSpec.shared_examples 'an invalid frame overlapping or touching a border and returning error' do |border|
  it "does not create a frame and returns the correct error for the #{border} border" do
    expect(frame_to_add)
      .to not_create_frame_and_return_error("messages.error.frame_overlap_or_touch_#{border}_border")
  end
end

RSpec.shared_examples 'an invalid frame overlapping or touching multiple borders and returning error' do
  it 'does not create a frame and returns the correct error' do
    expect(frame_to_add)
      .to not_create_frame_and_return_error('messages.error.frame_overlap_or_touch_multiple_borders')
  end
end