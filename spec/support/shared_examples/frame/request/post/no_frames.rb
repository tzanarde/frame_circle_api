RSpec.shared_examples 'no frames created' do
  let(:circle_expected_values) { frame_params[:circles_attributes] }

  it 'creates a frame' do
    expect(Frame.count).to eq(0)
  end

  it 'creates the circles' do
    expect(Circle.count).to eq(0)
  end
end