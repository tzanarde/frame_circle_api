RSpec.shared_examples 'a frame with circles within' do |frame|
  let(:circle_expected_values) { frame_params[:circles_attributes] }

  let(:circle_attribute_names) { [:center_x, :center_y, :diameter] }

  let(:circle_positions) do
    [
      { topmost_circle: :max_by, axis: :center_y},
      { rightmost_circle: :max_by, axis: :center_x },
      { bottommost_circle: :min_by, axis: :center_y },
      { leftmost_circle: :min_by, axis: :center_x }
    ]
  end

  include_examples 'a POST response with a frame', frame

  it 'creates the circles' do
    expect(Circle.count).to eq(Array(circle_expected_values).count)
  end

  it 'returns the correct amount of circles within' do
    expect(json['circles'].count).to eq(Array(circle_expected_values).count)
  end

  it 'returns the correct values for the circles within' do
    circle_expected_values.each_with_index do |circle, circle_index|
      circle_attribute_names.each do |attribute|
        expect(json['circles'][circle_index][attribute.to_s].to_f).to eq(circle[attribute])
      end
    end
  end
end

RSpec.shared_examples 'a frame with no circles within' do |frame|
  include_examples 'a POST response with a frame', frame

  it 'returns no circles within' do
    expect(json['circles']).to be_nil
  end
end

RSpec.shared_examples 'no frames created' do
  let(:circle_expected_values) { existing_frame[:circles_attributes] }

  it 'does not create a frame' do
    expect(Frame.count).to eq(0)
  end

  it 'does not create circles' do
    expect(Circle.count).to eq(0)
  end
end

RSpec.shared_examples 'a POST response with a frame' do |frame|
  include_examples 'a base frame response', frame
  
  it 'creates one frame' do
    expect(Frame.count).to eq(1)
  end
end
