RSpec.shared_examples 'no frames created' do
  let(:circle_expected_values) { frame_params[:circles_attributes] }

  it 'does not create a frame' do
    expect(Frame.count).to eq(0)
  end

  it 'does not create circles' do
    expect(Circle.count).to eq(0)
  end
end