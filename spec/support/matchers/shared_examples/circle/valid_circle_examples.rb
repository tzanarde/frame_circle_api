RSpec.shared_examples 'a valid circle on a frame' do
  before { circle_to_add.save }

  it 'creates a circle' do
    expect(circle_to_add).to be_valid.and be_persisted
  end

  it 'has no validation errors' do
    expect(circle_to_add.errors).to be_empty
  end

  it 'is placed within the correct frame' do
    expect(circle_to_add.frame).to eq(frame)
  end

  it 'has the correct values' do
    expect(circle_to_add.center_x).to eq(attributes_for_circle_to_add[:center_x])
    expect(circle_to_add.center_y).to eq(attributes_for_circle_to_add[:center_y])
    expect(circle_to_add.diameter).to eq(attributes_for_circle_to_add[:diameter])
  end
end