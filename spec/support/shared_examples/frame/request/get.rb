RSpec.shared_examples 'a response with a frame with circles within' do |frame|
  let(:circle_expected_values) { circles }
  let(:circle_attribute_names) { [:center_x, :center_y, :diameter] }
  let(:circle_positions) do
    [
      { topmost_circle: :max_by, axis: :center_y},
      { rightmost_circle: :max_by, axis: :center_x },
      { bottommost_circle: :min_by, axis: :center_y },
      { leftmost_circle: :min_by, axis: :center_x }
    ]
  end

  include_examples 'a GET response with a frame', frame

  it 'creates the circles' do
    expect(Circle.count).to eq(Array(circle_expected_values).count)
  end

  it 'returns the correct amount of circles within' do
    expect(json['circles_amount']).to eq(Array(circle_expected_values).count)
  end

  it 'returns the correct values for the extreme position circles within' do
    circle_positions.each do |position_info|
      position = position_info.keys.first
      method = position_info[position]
      axis = position_info[:axis]

      actual_value = json[position.to_s][axis.to_s].to_f
      expected_value = Array(circle_expected_values).public_send(method) { |circle| circle[axis] }[axis]

      expect(actual_value).to eq(expected_value)
    end
  end

  it 'returns the correct values for the circles within' do
    Array(circle_expected_values).each_with_index do |circle, circle_index|
      circle_attribute_names.each do |attribute|
        expect(json['circles'][circle_index][attribute.to_s].to_f).to eq(circle[attribute])
      end
    end
  end
end

RSpec.shared_examples 'a response with a frame with no circles within' do |frame|
  include_examples 'a GET response with a frame', frame

  it 'returns no circles within' do
    expect(json['circles']).to be_nil
  end
end

RSpec.shared_examples 'a GET response with a frame' do |frame|
  include_examples 'a base frame response', frame
  
  it 'returns one frame' do
    expect(json).to be_a(Hash)
  end
end
