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